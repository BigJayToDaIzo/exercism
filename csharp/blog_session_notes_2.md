# Blog Notes: Relearning C# for the Job Market

## Premise
- Returning to .NET after 2 years of Gleam/Rust
- .NET market is least saturated, best opportunity-to-competition ratio
- Exercism as the vehicle to knock the rust off (pun noted)
- Continuing from where blog post 1 left off

## Observations
- **BCL discovery tax: gleam/string vs System.String.** Gleam's string module has ~37 functions with no overloads — scannable in seconds. .NET's String class has ~82 distinct methods, many with 3-8 overloads each — the actual surface area is roughly 5:1. The docs are exhaustive but exhausting. Dot-into-it with a working LSP is the only sane discovery path, which circles back to the LSP needing to actually work.
- **Not every linter suggestion is worth pursuing.** IDE0290 (use primary constructor) sounds clean until you need public access to those parameters — then you're writing properties on top of the primary constructor, more ceremony than the original. On simple exercises especially, the "improvement" can make things worse. Know when to tell the analyzer to shut up.
