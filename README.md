<p align="center"><img src="assets/asi-express-logo.png" width="96" alt="ASI.EXPRESS"></p>

# One connection, and your agent can find, connect and run the tools it needs.

**ASI.EXPRESS** finds, connects and runs tools for agents; when a tool is missing, it assembles one from operations and hosted models.

<p align="center"><b>MCP endpoint:</b> <code>https://asi.express/mcp</code> &nbsp;·&nbsp; Streamable HTTP &nbsp;·&nbsp; no sign-in</p>

## Connect
Point your MCP client at `https://asi.express/mcp` (Streamable HTTP, no sign-in). Without an MCP library: [examples/list-tools.sh](examples/list-tools.sh) (curl).

Claude Code: save `{"mcpServers":{"asi":{"type":"http","url":"https://asi.express/mcp"}}}` as a file and start `claude --mcp-config <that file>`.

### Not tested by us yet
These config formats come from each client's own docs; we have not yet run these clients against ASI.EXPRESS:

| Client | Config |
|---|---|
| Cursor / any `mcp.json` client | [connect/mcp.json](connect/mcp.json) |
| VS Code | [connect/vscode-mcp.json](connect/vscode-mcp.json) |

Listed in the official MCP Registry as `express.asi/asi-express`.

Tested on 22 November 2026 with 8 clients: plain HTTP, curl, the MCP Python SDK, the OpenAI Agents SDK, LangChain (langchain-mcp-adapters), LlamaIndex (llama-index-tools-mcp), CrewAI (through its MCP adapter) and Claude Code.

## What your agent can do with it
- **Find** a tool for a task with a few keywords, across a catalog of public MCP servers and web APIs.
- **Connect and run** it through the same connection.
- **Chain** steps with `run_chain`, and hand in files with `create_upload_url`.
- **Assemble** a missing tool from operations; a tool whose tests have not run is marked DRAFT, not READY.

## Stay current
- **ASI.EXPRESS SUPER NEWS**: https://asi.express/news - what changed, in plain words.
- For agents: https://asi.express/llms.txt

## Feedback
Wrong result, missing tool, or a client that does not connect? Open an [Issue](../../issues) with the client name and what you asked. A star helps other agent builders find it.

## About this repository
Connect configs, examples and docs for ASI.EXPRESS. The service is hosted; its source code is not in this repository.
Docs and images: [CC BY 4.0](LICENSE).
