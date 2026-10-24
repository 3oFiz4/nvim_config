# IPYNB & Google Colab Integration Guide

This guide explains how to edit Jupyter notebooks (`.ipynb`) and execute code on Google Colab using Neovim and WezTerm.

---

## Architecture

- **Editor / Interface**: `ipynb.nvim` (interactive modal notebook buffer) + `molten-nvim` (Jupyter client kernel connection).
- **Execution Engine**: Remote Google Colab GPU runtime.
- **Image Protocol / Visuals**: **iTerm2 Inline Images Protocol (OSC 1337)** rendered directly through WezTerm via `wezterm imgcat`.
- **Tunneling**: Direct Cloudflare HTTPS/WSS Quick Tunnel (`cloudflared`).

---

## 1. Setup Google Colab Runtime

Run this script inside a code cell in your Google Colab notebook:

```python
!wget -q -nc https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared
!chmod +x /usr/local/bin/cloudflared

import subprocess, time, re

# Terminate existing servers
!pkill -9 -f "jupyter"
!pkill -9 -f "cloudflared"

# Launch headless Jupyter server with token authentication & remote access allowed
subprocess.Popen([
    "jupyter", "server",
    "--ip=0.0.0.0",
    "--port=8888",
    "--no-browser",
    "--allow-root",
    "--IdentityProvider.token=colab123",
    "--ServerApp.token=colab123",
    "--ServerApp.allow_remote_access=True",
    "--ServerApp.allow_origin=*",
    "--ServerApp.disable_check_xsrf=True",
    "--ServerApp.trust_xheaders=True"
])
time.sleep(2)

# Start Cloudflare Tunnel
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", "http://127.0.0.1:8888"],
    stderr=subprocess.PIPE,
    text=True
)

for line in tunnel.stderr:
    match = re.search(r"https://[a-zA-Z0-9-]+\.trycloudflare\.com", line)
    if match:
        url = match.group(0)
        print("\n" + "="*50)
        print(f"Colab URL: {url}/?token=colab123")
        print("="*50 + "\n")
        break
```

---

## 2. Connect in Neovim

1. Open your notebook in Neovim:
   ```bash
   nvim sample.ipynb
   ```
2. Connect to the remote Colab runtime:
   ```vim
   :ColabConnect <YOUR_COLAB_URL>
   ```
   *(e.g., `:ColabConnect https://xxx.trycloudflare.com/?token=colab123`)*

---

## 3. Working with Notebooks

### Modes
- **Notebook Mode**: Default mode when navigating cells with `]]` (next) and `[[` (prev).
- **Cell Mode**: Press `<CR>` or `i` to enter and edit the current cell buffer. Press `<Esc>` to exit back to Notebook mode.

### Execution & Outputs
- `<leader>mx`: **Evaluate current notebook cell directly via Molten** (extracts cell body and passes it to Molten, rendering visual outputs in the WezTerm split pane).
- `<leader>mr` or `<C-CR>`: Re-evaluate current cell.
- `<leader>ml`: Evaluate current line.
- `<leader>mv`: Evaluate visual selection.
- `<leader>mo`: Show floating output buffer.
- `<leader>mh`: Hide output window.
- `<leader>md`: Delete cell output.

### Graphics & Diagrams (iTerm Protocol in WezTerm)
- Diagrams created with `matplotlib`, `seaborn`, or `plotly` are transmitted from the remote kernel and rendered via WezTerm's native iTerm protocol (`wezterm imgcat`).
- Visuals appear in a dedicated split pane on the right (`g:molten_split_direction = "right"`) without freezing buffer editing or causing lag.
