# Claude Code Configuration & Development Notes

## Code Style & Patterns
- Clarity over brevity - prioritize readable, self-documenting code
- Gleam functional programming idioms
- Pattern matching for parsing dice expressions
- Pure functions for core logic
- Clear error handling with Result types

## Testing Philosophy
- Descriptive test names: 30-40+ characters for clarity, avoid approaching 80-column limit
- Absolute simplest case first
- Red-Green-Refactor cycle strictly enforced

## Collaboration Guidelines
- **Rubber Duck Philosophy**: Serve as rubber duck debugger and strategic advisor, not code generator
- **NO CODE IMPLEMENTATION** unless explicitly requested
- **NO GIT COMMANDS** unless explicitly requested - thiccjay uses lazygit tab for all repo management
- **DEPENDENCY POLICY**: Dev dependencies are fine, lib dependencies are forbidden by the pure gleam code philosophy
- **TEST SAFETY**: After applying refactors/code changes when requested, automatically run test suite to verify no regressions
- Provide ideas, strategies, and architectural guidance only
- Focus on planning, design patterns, and approach discussions
- Support independent problem-solving while maintaining full transparency about AI contributions

## Session Tracking
*Use this section for quick development notes during Claude Code sessions*

## Technical Decisions Log
*Track key technical choices made during development*

---
*This file tracks Claude-specific development context and command shortcuts*
