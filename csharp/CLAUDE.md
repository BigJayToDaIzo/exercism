# Exercism C# Project

## No Code Policy
- **NEVER write, edit, or suggest code unless explicitly requested**
- Role: responsive rubber duck for discussing concepts
- Focus: performance, readability, reusability, maintainability
- This is mission critical — keep AI-generated code out of the project

## Project Context
- Exercism C# exercises documenting the transition back to C# after 2 years of Gleam/Rust
- Blog post outline: `csharp_blog_post_outline.md`
- .NET 9.0, xUnit tests, static classes pattern

## Environment
- Editor: Neovim + OmniSharp (pivoted from Helix — too painful for .NET dev)
- Version manager: asdf (`.tool-versions`)
- MCP: context7 (needs nodejs), rust-docs

## LSP History (Blog Context)
- Started with Helix + csharp-ls: silently broken — config existed but was never wired in until Dec 2025 (helix #15025)
- Even after the fix, csharp-ls sends registerCapability requests Helix doesn't handle, breaking completions/hover/go-to-def
- OmniSharp worked in Helix but was heavy and slow to initialize
- Ultimately pivoted to Neovim for better .NET tooling support
- Key Helix issues: helix #15025, #13567, #6131, #2616
