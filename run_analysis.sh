#!/bin/bash
echo "Starting Neural Blueprint Growth Analysis..."
mkdir -p output

claude --headless \
  --mcp-config .claude/mcp.json \
  --allowedTools "computer,mcp__firecrawl__scrape,mcp__docx-writer__write_docx" \
  -p "Run the full newsletter growth analysis per CLAUDE.md instructions"

echo "Done. Check output/ for the generated .docx"