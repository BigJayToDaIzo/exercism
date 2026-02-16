# Blog Post: Freshening My C# (After 2 Years of Gleam & Rust)

*Draft outline — expand with notes from today's learning session, write up tomorrow morning.*

---

## The Setup Gauntlet (Dev Environment on Arch)
- Choosing Helix over VS Code — swimming against the current on purpose
- csharp-ls vs OmniSharp — the LSP saga that ate an evening
- asdf version management colliding with DOTNET_ROOT — environment variables haunting you across sessions
- Cached build artifacts silently using the wrong runtime — `dotnet clean` is your friend
- The feeling of earning your dev environment vs just clicking "install extension"
- Prior chat with full saga: https://claude.ai/chat/4503cd2c-db91-48d1-af15-e9ac5c2850d2

## The Paradigm Whiplash (Gleam/Rust → C#)
- 2 years of functional thinking rewires your brain
- Gleam's simplicity: no classes, no objects, no mutability — just data in, data out, build iteratively, every time. Simple.
- Coming back to OOP and suddenly needing to care about *where* state lives
- Static vs instance — a distinction that doesn't exist in functional land
- The cognitive overhead that has nothing to do with the actual problem you're solving
- It's not that C# is hard — it's that Gleam strips away all the ceremony

## Stop Snake_Casing Everything
- Rust/Gleam muscle memory means `get_balance` comes out automatically
- C# wants PascalCase for methods, camelCase for locals, `_underscore` for private fields
- No SCREAMING_SNAKE for constants — PascalCase even there
- Catch this early or you're refactoring everything later

## Death by a Thousand Suffixes
- `m` for decimal, `f` for float — C#'s type system doesn't let you be lazy
- No implicit conversion across the base-2 / base-10 boundary — intentional strictness
- Mixing decimal comparisons with double literals won't even compile
- Rust's compiler yells at you too, but for different reasons
- Exercism as a forcing function to hit all these edges

## The Tooling Gap (AI-Assisted Learning in 2026)
- Context7 MCP exists for Claude Code / Desktop — live docs injected into prompts
- But not available in the web UI — a real gap for learners
- Workaround: split workflow between web chat (writing/context) and Claude Code (learning with live docs)
- The irony of needing AI to help you relearn a language while the AI itself is guessing without docs

## The Silver Lining (Modern C# Isn't Your Dad's C#)
- Pattern matching, records, LINQ — the functional influence is real
- It's not Gleam-clean, but it's not 2008 enterprise Java either
- What C# still lacks (discriminated unions, pipe operator)
- Expression-bodied members and switch expressions feel almost functional

---

*Workflow: Learning happens in Claude Code with Context7 MCP. Blog writing happens in web chat. Notes bridge the two.*
