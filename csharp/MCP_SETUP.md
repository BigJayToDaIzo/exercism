# MCP Servers — C# Blog Research Project

Documentation sources configured for the blog post and C# learning project.

## Installed

### Context7 (General Documentation)
- **Package:** `@upstash/context7-mcp`
- **Runner:** `bunx` (not npx — we use bun for package management)
- **Scope:** Project-level (`.mcp.json` in project root)
- **Usage:** Include "use context7" in prompts for live, version-specific docs
- **Covers:** .NET/C#, Rust crates, and most popular libraries
- **No API key required** (free tier; key available at context7.com/dashboard for higher rate limits)

### rust-docs-mcp (Rust Documentation)
- **Package:** `rust-docs-mcp` (cargo install)
- **Binary:** `~/.cargo/bin/rust-docs-mcp`
- **Scope:** Project-level (`.mcp.json` in project root)
- **Requires:** Rust nightly toolchain (installed via `rustup toolchain install nightly`)
- **Provides:** Full rustdoc with signatures, fields, methods, dependency tracing, offline caching

## Not Yet Installed

### hexdocs-mcp (Gleam/Elixir Documentation)
- **Package:** `@bradleygolden/hexdocs-mcp`
- **Blocker:** Requires Elixir/Mix — not currently in asdf. Add with `asdf plugin add elixir && asdf install elixir latest`
- **Covers:** Gleam, Elixir, and Erlang packages via hexdocs.pm
- **Install when ready:** `bunx -y @smithery/cli@latest install @bradleygolden/hexdocs-mcp --client claude`

## Environment Notes
- **Version management:** asdf-vm
- **Current asdf runtimes:** dotnet (8/9/10), lua (5.1/5.3), nodejs (22.13.1)
- **Package manager:** bun 1.3.9
- **Rust toolchains:** stable, nightly, plus pinned 1.81/1.82/1.84
