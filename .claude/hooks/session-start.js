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
// 5. Smart Agent Suggestions (based on project)
// ============================================
function detectProjectContext() {
  const suggestions = [];
  const cwd = process.cwd();

  // Detect React/Next.js
  if (fs.existsSync(path.join(cwd, 'package.json'))) {
    try {
      const pkg = JSON.parse(fs.readFileSync(path.join(cwd, 'package.json'), 'utf8'));
      const deps = { ...pkg.dependencies, ...pkg.devDependencies };

      if (deps['react'] || deps['next']) {
        suggestions.push('@frontend - React/Next.js expert');
      }
      if (deps['express'] || deps['fastify'] || deps['nestjs']) {
        suggestions.push('@backend - Node.js API expert');
      }
      if (deps['prisma'] || deps['typeorm'] || deps['mongoose']) {
        suggestions.push('@database - Database expert');
      }
      if (deps['jest'] || deps['vitest'] || deps['playwright']) {
        suggestions.push('@tester - Testing expert');
      }
      if (deps['tailwindcss']) {
        suggestions.push('@frontend - TailwindCSS expert');
      }
    } catch (e) {}
  }

  // Detect Docker
  if (fs.existsSync(path.join(cwd, 'Dockerfile')) || fs.existsSync(path.join(cwd, 'docker-compose.yml'))) {
    suggestions.push('@devops - Docker/CI-CD expert');
  }

  // Detect security concerns
  if (fs.existsSync(path.join(cwd, '.env.example')) || fs.existsSync(path.join(cwd, 'src', 'auth'))) {
    suggestions.push('@security - Security expert');
  }

  return suggestions;
}

const agentSuggestions = detectProjectContext();
if (agentSuggestions.length > 0) {
  additionalContext += `\n## 🤖 Suggested Agents (based on project)\n`;
  agentSuggestions.forEach(agent => {
    additionalContext += `- ${agent}\n`;
  });
  additionalContext += `\nUse \`@agent-name\` to invoke these specialists.\n`;
}

// ============================================
// Output JSON for Claude Code to consume
// ============================================
if (additionalContext) {
  console.log(JSON.stringify({
    additionalContext: additionalContext
  }));
}
