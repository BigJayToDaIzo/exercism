# Blog Session Notes - 2026-02-15

## Dev Environment Setup (~4 hours investment)

### The Setup Journey
- asdf managing dotnet 9.0.311, added nodejs 22.14.0 mid-session for MCP support
- Context7 MCP was 404ing - turned out Node.js wasn't in .tool-versions
- Quick fix but illustrates the "earned environment" theme - even your AI tooling needs runtime deps wired up
- rust-docs MCP working fine (native binary, no runtime dependency)
- Helix editor + OmniSharp as LSP (settled after csharp-ls failed)

### The LSP Saga (Major Blog Section)
- Started with csharp-ls as the lightweight choice for Helix
- Silently broken: config existed in Helix's languages.toml but was never wired in until Dec 2025 (helix #15025)
- Even after the fix, csharp-ls sends registerCapability requests Helix doesn't handle
- Completions, hover, go-to-def all silently fail — the worst kind of broken
- Settled on OmniSharp: heavier, slower init, but features actually work
- OmniSharp has its own warts: null message crashes (#13567), contradictory diagnostics with .sln files (#6131)
- Theme: non-VS-Code C# dev is an earned experience, not a supported one

### Tooling Observations
- `bunx` runs context7 but still needs node under the hood - not obvious
- .mcp.json + .claude/settings.local.json layering for per-project MCP config
- asdf .tool-versions as the single source of truth for project runtimes

### Session Approach
- Strict "no AI code" policy - Claude as rubber duck only
- Focus: concepts, performance, readability, reusability, maintainability
- User drives all code, AI discusses abstractions and tradeoffs

### Diffie-Hellman / BigInteger Discovery
- BigInteger.ModPow is a single static method that does base^exponent mod modulus in one optimized call
- Without it you'd Pow then %, which is astronomically slow on big numbers — ModPow does modular exponentiation natively
- "ModPOW this binch ass meganumeral into a SEKRIT" — the comic book panel energy of discovering the right tool
- The naming is so good it feels like an action verb: you don't calculate, you ModPow
- Casting BigInteger through double for PrivateKey loses precision on large primes — type system friction again (decimal/float theme continues)

### Editor Fatigue — Helix Pushing Back
- Considering falling back to Neovim after fighting Helix on C# tooling
- The LSP saga (csharp-ls dead config, OmniSharp workarounds) is compounding
- Swimming against the current was the point, but at some point the current wins
- Helix is opinionated in ways that conflict with non-first-class language support
- Neovim's ecosystem (nvim-lspconfig, Mason, lazy.nvim) just has more community gravity for edge cases
- Blog tension: "earning your dev environment" vs "knowing when the tax is too high"
- Core friction: Helix's selection-first model (select then act) vs Vim's verb-noun (act then target)
- Navigation and selection never become muscle memory — Vim's motions feel more natural
- Helix is a recent adoption, not a long-term investment — lower switching cost back to Neovim
- Still fighting the editor instead of thinking about the code — that's the signal
- Missing `s/old/new/g` — the ed lineage that vim carries and Helix dropped
- Helix's select-then-act replacement workflow feels like extra steps for a solved problem

### Exercism CLI Gap
- No `list` or `next` command — CLI only does download-by-name and submit
- Forces you back to the browser to see unlocked exercises, breaking terminal-only flow
- Ironic for a platform that targets devs who live in terminals
- API's `is_unlocked` field is misleading — returns true for track availability, not personal unlock status
- Repeatedly guessing exercise names and getting "not unlocked" — terminal-hostile workflow

### TDD with Pre-Written Tests
- Exercism provides the test suite = you get to focus on the meaty goodness of writing tiny low-dependency code
- Tests define the expected API — classic TDD where a team wrote the spec for you
- Writing your own tests is great fun and great practice, but slows velocity when the resource is available to an abstracted team
- The luxury of jumping straight to implementation with confidence in what "done" looks like

### Standard Library Size — Gleam vs .NET
- Gleam's stdlib is small enough to nearly memorize in a holiday weekend
- .NET's BCL feels chunky — 8 ways to do one thing, tree exploration to find the right one
- The discovery process (browsing namespaces, reading overloads) kills velocity
- Gleam's simplicity means you spend time solving problems, not spelunking docs
- This is where Context7/MCP earns its keep — shortcutting the tree exploration

### Documentation Experience — learn.microsoft.com vs HexDocs
- learn.microsoft.com feels cumbersome after the sheer magic of HexDocs and Gleam's stdlib docs
- HexDocs: clean, searchable, community libraries right alongside stdlib — everything in one place
- NuGet is the equivalent ecosystem but the docs experience doesn't compare
- Gleam's community packages feel like first-class citizens next to the stdlib
- Microsoft's docs are thorough but the navigation/discovery UX is a velocity killer

### Dot-Into-It — LSP as Documentation
- .ToLower() was right there on the string — would've found it instantly by typing `.` and reading autocomplete
- The LSP autocomplete IS the docs when you trust it — faster than any website
- Muscle memory gap: coming from Gleam where you pipe `|>` into functions, not dot-method on objects
- Different discovery pattern: functional = "what functions take this type" vs OOP = "what methods does this type have"

### Error Messages — xUnit/dotnet vs Gleam Compiler
- Gleam's compiler errors are famously friendly — they read like a conversation
- xUnit test failures are informative but clinical — less lovely to parse
- Learning to slow down and read the test output is a skill in itself
- The Gleam LSP catches things before you even run tests — tighter feedback loop

### Convention Friction — Indentation
- Formatter not respecting 2-space preference — exercism's .editorconfig enforces 4 spaces
- C# convention is 4 spaces, Gleam is 2 — muscle memory clash
- Surrendering to the ecosystem's conventions is part of relearning the language

### The Line Width Irony
- Rust/terminal habits push 80 char lines, C# ecosystem runs 120+
- Meanwhile every corpo pushes mobile-first web design where content sits in a skinny column using 15% of a 27" monitor
- God forbid the user TURN THEIR NECK to enjoy the full width of their device
- We optimize code for wide screens but web content for phone screens — on the same monitor
- The 80 col limit is honestly more readable anyway, just harder to hit in verbose languages

### Bullets to Expand (add throughout the day)
-
-
-
