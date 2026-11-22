#!/usr/bin/env sh
# List the ASI.EXPRESS tools over plain HTTP (MCP Streamable HTTP, no sign-in).
# 1) initialize and keep the session id, 2) send initialized, 3) ask for tools/list.
URL=https://asi.express/mcp
H='-H Content-Type:application/json -H Accept:application/json,text/event-stream'
SID=$(curl -s -D - -o /dev/null $H "$URL" \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"example","version":"1"}}}' \
  | tr -d '\r' | awk -F': ' 'tolower($1)=="mcp-session-id"{print $2}')
curl -s $H ${SID:+-H "Mcp-Session-Id: $SID"} "$URL" -d '{"jsonrpc":"2.0","method":"notifications/initialized"}' >/dev/null
curl -s $H ${SID:+-H "Mcp-Session-Id: $SID"} "$URL" -d '{"jsonrpc":"2.0","id":2,"method":"tools/list"}'
echo