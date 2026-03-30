# Newsletter Growth Analyst

A Claude Code agent that performs a full deep-dive analysis of a Substack newsletter and outputs a Word document with actionable growth recommendations.

## What it does

1. Scrapes the newsletter homepage and top-performing archive posts
2. Extracts content patterns, audience signals, and writing style across posts
3. Maps growth opportunities: content gaps, format gaps, SEO keywords
4. Generates 10 evidence-backed content ideas and a prioritized growth strategy
5. Writes everything to a structured `.docx` report in `output/`

## Project structure

```
newsletter-analyst/
├── CLAUDE.md               # Agent instructions (execution phases, hard rules)
├── run_analysis.sh         # Entry point — runs the agent with MCP tools loaded
├── claude/
│   └── mcp.json            # MCP server config (firecrawl + docx-writer)
├── tools/
│   └── write_docx.py       # MCP server that exposes write_docx tool
└── output/
    └── growth_analysis.docx
```

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed
- Node.js (for `npx firecrawl-mcp`)
- Python 3 with `python-docx` and `mcp` packages

```bash
pip install python-docx mcp
```

- A [Firecrawl API key](https://firecrawl.dev) — set in `.claude/mcp.json`

## Running the analysis

### With MCP tools (full pipeline)

```bash
./run_analysis.sh
```

This launches Claude Code in headless mode with firecrawl (scraping) and docx-writer (output) MCP servers loaded.

### Without MCP (WebFetch + direct Python output)

Open Claude Code interactively and run:

```
Run the full newsletter growth analysis as defined in CLAUDE.md
```

Claude will use `WebFetch` for scraping and `generate_report.py` for the `.docx` output.

## Output

The report is written to `output/neural_blueprint_growth_analysis.docx` and contains:

1. Executive Summary
2. Audience Profile
3. Problems Solved (with post examples)
4. Content Themes & Patterns
5. Writing Style Analysis
6. Content Gaps & Opportunities
7. 10 Specific Content Ideas
8. Growth Strategy (SEO, repurposing, segmentation)
9. Competitive Positioning
10. Top 5 Next Steps

## Configuring for a different newsletter

Edit `CLAUDE.md` under **Newsletter Details**:

```markdown
## Newsletter Details (Pre-configured)
- URL: https://your-newsletter.substack.com
- Archive: https://your-newsletter.substack.com/archive?sort=top
- Subscribers: ...
- Frequency: ...
- Topics: ...
- Goal: ...
```

The agent will follow the same analysis phases for any Substack newsletter.
