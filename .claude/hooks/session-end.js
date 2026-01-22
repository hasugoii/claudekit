#!/usr/bin/env node
/**
 * ClaudeKit Session End Hook
 * Saves session state when session ends
 */

const fs = require('fs');
const path = require('path');

const brainDir = path.join(process.cwd(), '.brain');
const sessionPath = path.join(brainDir, 'session.json');

// Ensure .brain directory exists
if (!fs.existsSync(brainDir)) {
  fs.mkdirSync(brainDir, { recursive: true });
}

// Update session.json with last activity timestamp
let session = {};
if (fs.existsSync(sessionPath)) {
  try {
    session = JSON.parse(fs.readFileSync(sessionPath, 'utf8'));
  } catch (e) {
    session = {};
  }
}

session.last_session_end = new Date().toISOString();
session.session_count = (session.session_count || 0) + 1;

fs.writeFileSync(sessionPath, JSON.stringify(session, null, 2));

console.log(JSON.stringify({ success: true }));
