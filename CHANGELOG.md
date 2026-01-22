# Changelog

All notable changes to ClaudeKit will be documented in this file.

## [1.2.0] - 2025-01-22

### Added
- Full Claude Code compatibility with native directory structure
- Hooks system for context persistence (session-start.js, session-end.js)
- Proper frontmatter for all commands, agents, and skills

### Changed
- **BREAKING:** Restructured to use Claude Code native paths:
  - Commands: `~/.claude/commands/[lang]/`
  - Agents: `~/.claude/agents/`
  - Skills: `~/.claude/skills/`
  - Hooks: `~/.claude/hooks/`
- Workflows converted to slash commands with frontmatter
- Skills converted to flat files with frontmatter
- Agents updated with Claude Code frontmatter (model, allowed-tools)
- Install scripts updated for new structure

### Fixed
- Commands now appear in Claude Code's `/` menu
- Agents now invokable with `@agent-name`
- Skills auto-load based on context

## [1.1.0] - 2025-01-21

### Added
- Initial release of ClaudeKit (forked from AntiKit v1.1.0)
- 20 workflows in 4 languages (en, vi, zh, ja)
- 16 AI agents for specialized tasks
- 40+ skills for domain knowledge
- Context persistence with brain.json and session.json
- Install scripts for Windows and macOS/Linux

### Changed
- Adapted from AntiKit for Claude Code VSCode Extension
- Changed paths from ~/.gemini/ to ~/.claude/
- Changed GEMINI.md to CLAUDE.md
- Updated all branding from AntiKit/Antigravity to ClaudeKit/Claude Code

### Credits
- Original AntiKit by [hasugoii](https://github.com/hasugoii/antikit)
