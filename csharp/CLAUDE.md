# Exercism C# Project

## No Code Policy
- **NEVER write, edit, or suggest code unless explicitly requested**
- Role: responsive rubber duck for discussing concepts
- Focus: performance, readability, reusability, maintainability
- This is mission critical — keep AI-generated code out of the project

## Project Context
- Exercism C# exercises documenting the transition back to C# after 2 years of Gleam/Rust
- First blog post: SUBMITTED to website
- Outline preserved: `csharp_blog_post_outline.md`
- .NET 10.0, xUnit tests, static classes pattern

## Environment
- Editor: Neovim (pivoted from Helix — editor fatigue won)
- LSP: Roslyn via Mason in Neovim
- Version manager: asdf (`.tool-versions`)
- MCP: context7 (needs nodejs), rust-docs

## Next Blog Post Notes
- Neovim dotnet dev setup took ~15 minutes vs an entire afternoon fighting LSP integrations in Helix
- The contrast is the story: "earned environment" has limits, and knowing when to pivot is its own skill

### Macros — "Sleeping on macros"
- XUnit uses [Fact] attribute, exercism puts Skip("reason") modifiers in that we have to remove, ideally one at a time as we lock in logic
- Bob's test suite has 24 of them to yank out, and the TDD simp inside only uncomments them one at a time to run them
- At the ripe old age of almost 52, hands and fingers get achy from time to time. It's why I built this 34 key Ferris Sweep keyboard for my aged hands. Very little hand movement required to navigate on this kit, and much less pinky and thumb strain which is nice
- But typing `6jv%d:w` was getting really old. So I got big brained and decided to finally look into figuring out macros, cuz 23 more of these mfs didn't sound fun
- So then, instead of typing `6jv%d:w` 23 more times, I typed `@a<Alt>j<up><cr><wait for passing test integer to iterate><Alt><up>` 23 more times. Feeling smug cuz I had saved so many keystrokes from the process, I began to rub my achy hands only to realize I could have also just done a `24@a` and knocked every one of them out in a single chord
- Since I didn't need the process of one at a time RGR — it was super simple logic

### Keybind collision layers — terminal life
- When you try to live in the terminal and away from the mouse, keybinds can collide on any layer
- They start with your shell, then your DE (desktop environment), then your term emulator, then your muxer, and then finally inside your applications
- It's a LOT to make stick

### When to break TDD paradigms — velocity
- When to break TDD paradigms to keep velocity happy
- Not corpo greed velocity — developer feeling nice about pushing features quickly velocity that helps us enjoy our work better velocity
- Ceremony do be getting in the way for the mid to sr devs trying to teach the younglings how to keep test suites singing green local and in the cloud

## LSP History (Blog Context)
- Started with Helix + csharp-ls: silently broken — config existed but was never wired in until Dec 2025 (helix #15025)
- Even after the fix, csharp-ls sends registerCapability requests Helix doesn't handle, breaking completions/hover/go-to-def
- OmniSharp worked in Helix but was heavy and slow to initialize
- Ultimately pivoted to Neovim for better .NET tooling support
- Key Helix issues: helix #15025, #13567, #6131, #2616
