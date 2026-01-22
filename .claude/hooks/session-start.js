#!/usr/bin/env node
/**
 * ClaudeKit Session Start Hook
 * Automatically loads brain.json context when session starts
 */

const fs = require('fs');
const path = require('path');

const brainPath = path.join(process.cwd(), '.brain', 'brain.json');
const sessionPath = path.join(process.cwd(), '.brain', 'session.json');

let additionalContext = '';

// Load brain.json if exists
if (fs.existsSync(brainPath)) {
  try {
    const brain = JSON.parse(fs.readFileSync(brainPath, 'utf8'));
    additionalContext += `\n## Project Knowledge (from .brain/brain.json)\n`;
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

// Load session.json if exists
if (fs.existsSync(sessionPath)) {
  try {
    const session = JSON.parse(fs.readFileSync(sessionPath, 'utf8'));
    additionalContext += `\n## Session State (from .brain/session.json)\n`;
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

// Output JSON for Claude Code to consume
if (additionalContext) {
  console.log(JSON.stringify({
    additionalContext: additionalContext
  }));
}
