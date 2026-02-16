# Blog Post: Freshening My C# (After 2 Years of Gleam & Rust)

*Revised outline — incorporating session notes from 2025-02-15. Ready to draft.*

---

## 1. The Setup Gauntlet (Dev Environment on Arch)
- Choosing Helix over VS Code — swimming against the current on purpose
- csharp-ls vs OmniSharp — the LSP saga that ate an evening
  - csharp-ls: silently broken config in Helix until Dec 2025 (helix #15025)
  - Even after the fix, registerCapability requests Helix doesn't handle — completions/hover/go-to-def silently fail
  - OmniSharp: heavier, slower init, but features actually work
  - OmniSharp's own warts: null message crashes (#13567), contradictory diagnostics with .sln files (#6131)
- asdf version management colliding with DOTNET_ROOT — environment variables haunting you across sessions
- Cached build artifacts silently using the wrong runtime — `dotnet clean` is your friend
- MCP servers needing their own runtimes wired through asdf — even your AI tooling has dependency chains
- Theme: non-VS-Code C# dev is an earned experience, not a supported one

## 2. Swimming Against the Current (Editor Fatigue)
- The philosophy: earning your environment is the point
- But Helix is pushing back on C# in ways that compound painpoints
- Core friction: selection-first (select then act) vs Vim's verb-noun (act then target)
  - I'm missing nvim more and more each day Helix pushes back on my dotnet dev kit
- Navigation and selection never become muscle memory — Vim's motions feel more natural
- Missing `s/old/new/g` — the ed lineage search/replace with regex that Vim carries and Helix dropped
- Helix is a recent adoption, not a long-term investment — lower switching cost
- "Still fighting the editor instead of thinking about the code — that's the signal"
- Tension: "earning your dev environment" vs "knowing when the tax is too high"

## 3. The Paradigm Whiplash (Gleam/Rust → C#)
- 2 years of functional thinking rewires your brain
- Gleam's simplicity: no classes, no objects, no mutability — just data in, data out, build iteratively, every time. Simple.
- Coming back to OOP and suddenly needing to care about *where* state lives
- Static vs instance — a distinction that doesn't exist in functional land
- Different discovery patterns: functional = "what functions take this type?" vs OOP = "what methods does this type have?"
- The pipe `|>` vs the dot `.` — different mental models for composition
- The cognitive overhead that has nothing to do with the actual problem you're solving
- It's not that C# is hard — it's that Gleam strips away all the ceremony

## 4. Convention Friction (Muscle Memory vs Ecosystem)
- **Naming:** Rust/Gleam muscle memory means `get_balance` comes out automatically
  - C# wants PascalCase for methods, camelCase for locals, `_underscore` for private fields
  - No SCREAMING_SNAKE for constants — PascalCase even there
  - Catch this early or you're refactoring everything later
- **Indentation:** formatter not respecting 2-space preference — Exercism's .editorconfig enforces 4
  - C# convention is 4 spaces, Gleam is 2 — surrendering to the ecosystem is part of relearning
- **Line width:** Rust/terminal habits push 80 chars, C# ecosystem runs 120+
  - Meanwhile every corpo pushes mobile-first web design where content sits in a skinny column using 15% of a 27" monitor
  - God forbid the user TURN THEIR NECK to enjoy the full width of their device
  - We optimize code for wide screens but web content for phone screens — on the same monitor

## 5. Death by a Thousand Suffixes (Type System Friction)
- `m` for decimal, `f` for float — C#'s type system doesn't let you be lazy
- No implicit conversion across the base-2 / base-10 boundary — intentional strictness
- Mixing decimal comparisons with double literals won't even compile
- BigInteger.ModPow — discovering the right tool changes everything
  - Without it you'd Pow then %, astronomically slow on big numbers
  - "ModPow this binch ass meganumeral into a SEKRIT" — the comic book panel energy
  - Casting BigInteger through double for PrivateKey loses precision on large primes — type friction continues
- Rust's compiler yells at you too, but for different reasons
- Exercism as a forcing function to hit all these edges

## 6. Exercism as a Vehicle (TDD Without the Setup Tax)
- Pre-written test suites = jump straight to the meaty goodness of implementation
- Tests define the expected API — classic TDD where a team wrote the spec for you
- Writing your own tests is great practice, but slows velocity when the spec is already there
- The luxury of knowing exactly what "done" looks like
- CLI gap: no `list` or `next` command — forces you back to the browser
  - Ironic for a platform that leans into devs who live in terminals
  - Repeatedly guessing exercise names and getting "not unlocked" — terminal-hostile workflow

## 7. The Documentation Gap (Spelunking vs Discovering)
- **.NET BCL (Base Core Lib):** 8 ways to do one thing, tree exploration to find the right one
  - Gleam's stdlib is small enough to nearly memorize in a holiday weekend
  - The discovery process (browsing namespaces, reading overloads) kills velocity
- **Docs UX:** learn.microsoft.com feels cumbersome after HexDocs
  - HexDocs: clean, searchable, community libraries alongside stdlib — everything in one place
  - Microsoft's docs are thorough but the navigation/discovery UX is a velocity killer
- **Dot-into-it:** LSP autocomplete IS the docs when you trust it — faster than any website
  - `.ToLower()` was right there on the string — would've found it by typing `.`
  - But this only works if your LSP works (callback to section 1)
- **Error messages:** Gleam's compiler errors read like a conversation; xUnit failures are clinical
  - Gleam LSP catches things before you even run tests — tighter feedback loop

## 8. The Tooling Gap (AI-Assisted Learning in 2026)
- Context7 MCP exists for Claude Code / Desktop — live docs injected into prompts
- But not available in the web UI — a real gap for learners
- Workaround: split workflow between web chat (writing/context) and Claude Code (learning with live docs)
- The irony of needing AI to help you knock the dust off a familiar language while the AI itself is guessing about configuring itself
- Strict "no AI code" policy — Claude as rubber duck only
  - Focus: concepts, performance, readability, reusability, maintainability
  - The discipline of keeping AI-generated code out of a learning project
- MCP itself has dependency chains: asdf runtimes, bunx/npx, cargo installs — setup is non-trivial
- This is where Context7/MCP earns its keep — shortcutting the tree exploration of .NET's BCL

## 9. The Silver Lining (Modern C# Isn't Your Dad's C#)
- Pattern matching, records, LINQ — the functional influence leanings are strong these days!
- Expression-bodied members and switch expressions feel almost functional
- It's not Gleam-clean, but it's not 2008 enterprise Java either
- What C# still lacks: discriminated unions, pipe operator
- The relearning itself is the value — seeing your old language through new eyes

---

