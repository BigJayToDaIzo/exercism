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
- Editor: Helix + OmniSharp (settled after csharp-ls failed — see below)
- Version manager: asdf (`.tool-versions`)
- MCP: context7 (needs nodejs), rust-docs

## LSP History (Blog Context)
- csharp-ls was first choice but silently broken in Helix — config existed but was never wired in until Dec 2025 (helix #15025)
- Even after the fix, csharp-ls sends registerCapability requests Helix doesn't handle, breaking completions/hover/go-to-def
- OmniSharp works end-to-end despite being heavier and slower to initialize
- Key issues: helix #15025, #13567, #6131, #2616
