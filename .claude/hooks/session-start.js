#!/usr/bin/env node
/**
 * ClaudeKit Session Start Hook
 * Automatically loads:
 * - brain.json context
 * - session.json state
 * - rules.md project rules
 * - safety.json protection rules
 * - Smart agent suggestions based on project
 */

const fs = require('fs');
const path = require('path');

const brainPath = path.join(process.cwd(), '.brain', 'brain.json');
const sessionPath = path.join(process.cwd(), '.brain', 'session.json');
const rulesPath = path.join(process.cwd(), '.claudekit', 'rules.md');
const safetyPath = path.join(process.cwd(), '.claudekit', 'safety.json');

let additionalContext = '';

// ============================================
// 1. Load Project Rules (.claudekit/rules.md)
// ============================================
if (fs.existsSync(rulesPath)) {
  try {
    const rules = fs.readFileSync(rulesPath, 'utf8');
    additionalContext += `\n## 🛡️ PROJECT RULES (MUST FOLLOW)\n`;
    additionalContext += rules;
    additionalContext += `\n---\n`;
  } catch (e) {
    // Ignore read errors
  }
}

// ============================================
// 2. Load Safety Configuration
// ============================================
if (fs.existsSync(safetyPath)) {
  try {
    const safety = JSON.parse(fs.readFileSync(safetyPath, 'utf8'));
    additionalContext += `\n## ⚠️ SAFETY WARNINGS\n`;

    // Dangerous commands
    if (safety.dangerous_commands?.patterns?.length) {
      additionalContext += `\n### Dangerous Commands (ASK BEFORE RUNNING):\n`;
      safety.dangerous_commands.patterns.slice(0, 10).forEach(cmd => {
        additionalContext += `- \`${cmd}\`\n`;
      });
      additionalContext += `- ... and ${safety.dangerous_commands.patterns.length - 10} more\n`;
    }

    // Protected files
    if (safety.protected_files?.patterns?.length) {
      additionalContext += `\n### Protected Files (NEVER READ/MODIFY):\n`;
      safety.protected_files.patterns.forEach(pattern => {
        additionalContext += `- \`${pattern}\`\n`;
      });
    }

    additionalContext += `\n---\n`;
  } catch (e) {
    // Ignore parse errors
  }
}

// ============================================
// 3. Load brain.json (Project Knowledge)
// ============================================
if (fs.existsSync(brainPath)) {
  try {
    const brain = JSON.parse(fs.readFileSync(brainPath, 'utf8'));
    additionalContext += `\n## 🧠 Project Knowledge (from .brain/brain.json)\n`;
    additionalContext += `- **Project:** ${brain.project?.name || 'Unknown'}\n`;
    additionalContext += `- **Tech Stack:** ${JSON.stringify(brain.tech_stack || {})}\n`;
    additionalContext += `- **Key Files:** ${(brain.key_files || []).join(', ')}\n`;
    if (brain.conventions) {
      additionalContext += `- **Conventions:** ${JSON.stringify(brain.conventions)}\n`;
    }
  } catch (e) {
    // Ignore parse errors
  }
}

// ============================================
// 4. Load session.json (Session State)
// ============================================
if (fs.existsSync(sessionPath)) {
  try {
    const session = JSON.parse(fs.readFileSync(sessionPath, 'utf8'));
    additionalContext += `\n## 📋 Session State (from .brain/session.json)\n`;
    additionalContext += `- **Current Task:** ${session.current_task || 'None'}\n`;
    additionalContext += `- **Current Phase:** ${session.current_phase || 'None'}\n`;
    if (session.pending_tasks?.length) {
      additionalContext += `- **Pending Tasks:** ${session.pending_tasks.join(', ')}\n`;
    }
    if (session.last_error) {
      additionalContext += `- **Last Error:** ${session.last_error}\n`;
    }
  } catch (e) {
    // Ignore parse errors
  }
}

// ============================================
// 5. Smart Agent Auto-Loading (based on project + task)
// ============================================

// Global agents directory (ClaudeKit installation)
const globalAgentsDir = path.join(process.env.HOME || process.env.USERPROFILE, '.claude', 'agents');
// Project-level agents (if exists)
const projectAgentsDir = path.join(process.cwd(), '.claude', 'agents');

function loadAgentInstructions(agentName) {
  // Try project-level first, then global
  const projectPath = path.join(projectAgentsDir, `${agentName}.md`);
  const globalPath = path.join(globalAgentsDir, `${agentName}.md`);

  let agentPath = null;
  if (fs.existsSync(projectPath)) {
    agentPath = projectPath;
  } else if (fs.existsSync(globalPath)) {
    agentPath = globalPath;
  }

  if (agentPath) {
    try {
      let content = fs.readFileSync(agentPath, 'utf8');
      // Remove frontmatter if exists
      content = content.replace(/^---[\s\S]*?---\n*/m, '');
      return content;
    } catch (e) {
      return null;
    }
  }
  return null;
}

function detectAndLoadAgents() {
  const cwd = process.cwd();
  const loadedAgents = [];
  const agentInstructions = [];

  // Detect project type and auto-load appropriate agents
  if (fs.existsSync(path.join(cwd, 'package.json'))) {
    try {
      const pkg = JSON.parse(fs.readFileSync(path.join(cwd, 'package.json'), 'utf8'));
      const deps = { ...pkg.dependencies, ...pkg.devDependencies };

      // Frontend project
      if (deps['react'] || deps['next'] || deps['vue'] || deps['angular']) {
        const instructions = loadAgentInstructions('frontend');
        if (instructions) {
          loadedAgents.push('frontend');
          agentInstructions.push(instructions);
        }
      }

      // Backend project
      if (deps['express'] || deps['fastify'] || deps['nestjs'] || deps['koa']) {
        const instructions = loadAgentInstructions('backend');
        if (instructions) {
          loadedAgents.push('backend');
          agentInstructions.push(instructions);
        }
      }

      // Database project
      if (deps['prisma'] || deps['typeorm'] || deps['mongoose'] || deps['sequelize']) {
        const instructions = loadAgentInstructions('database');
        if (instructions) {
          loadedAgents.push('database');
          agentInstructions.push(instructions);
        }
      }

      // Testing focused
      if (deps['jest'] || deps['vitest'] || deps['playwright'] || deps['cypress']) {
        const instructions = loadAgentInstructions('tester');
        if (instructions) {
          loadedAgents.push('tester');
          agentInstructions.push(instructions);
        }
      }

    } catch (e) {}
  }

  // Python project
  if (fs.existsSync(path.join(cwd, 'requirements.txt')) ||
      fs.existsSync(path.join(cwd, 'pyproject.toml')) ||
      fs.existsSync(path.join(cwd, 'setup.py'))) {
    // Load backend agent for Python
    const instructions = loadAgentInstructions('backend');
    if (instructions && !loadedAgents.includes('backend')) {
      loadedAgents.push('backend');
      agentInstructions.push(instructions);
    }
  }

  // Docker/DevOps project
  if (fs.existsSync(path.join(cwd, 'Dockerfile')) ||
      fs.existsSync(path.join(cwd, 'docker-compose.yml')) ||
      fs.existsSync(path.join(cwd, '.github', 'workflows'))) {
    const instructions = loadAgentInstructions('devops');
    if (instructions && !loadedAgents.includes('devops')) {
      loadedAgents.push('devops');
      agentInstructions.push(instructions);
    }
  }

  // Security-sensitive project
  if (fs.existsSync(path.join(cwd, 'src', 'auth')) ||
      fs.existsSync(path.join(cwd, 'src', 'security')) ||
      fs.existsSync(path.join(cwd, '.env.example'))) {
    const instructions = loadAgentInstructions('security');
    if (instructions && !loadedAgents.includes('security')) {
      loadedAgents.push('security');
      agentInstructions.push(instructions);
    }
  }

  // Limit to max 2 agents to avoid context overflow
  return {
    loaded: loadedAgents.slice(0, 2),
    instructions: agentInstructions.slice(0, 2)
  };
}

const autoLoadedAgents = detectAndLoadAgents();

if (autoLoadedAgents.loaded.length > 0) {
  additionalContext += `\n## 🤖 AUTO-LOADED AGENTS (based on project)\n`;
  additionalContext += `**Active Agents:** ${autoLoadedAgents.loaded.map(a => '@' + a).join(', ')}\n\n`;
  additionalContext += `You have been enhanced with the following specialist knowledge:\n\n`;

  autoLoadedAgents.instructions.forEach((instruction, idx) => {
    additionalContext += `### Agent: @${autoLoadedAgents.loaded[idx]}\n`;
    additionalContext += instruction;
    additionalContext += `\n---\n`;
  });

  additionalContext += `\n**Behavior:** Apply the expertise above automatically when relevant to the task.\n`;
  additionalContext += `User can still invoke other agents manually with \`@agent-name\`.\n`;
}

// ============================================
// Output JSON for Claude Code to consume
// ============================================
if (additionalContext) {
  console.log(JSON.stringify({
    additionalContext: additionalContext
  }));
}
