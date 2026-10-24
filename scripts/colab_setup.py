"""
Google Colab Direct Tunnel for Neovim (WezTerm + Molten)
---------------------------------------------------------
Zero SSH, zero local port forwarding, zero System32 modifications.
Exposes Colab Jupyter directly via Cloudflare HTTPS/WSS tunnel.

1. Paste & run this in a cell on Google Colab:
--------------------------------------------------
!wget -q -nc https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared
!chmod +x /usr/local/bin/cloudflared

import subprocess, time, re

# Launch Jupyter server headless with remote access flags
subprocess.Popen([
    "jupyter", "notebook",
    "--ip=0.0.0.0",
    "--port=8888",
    "--no-browser",
    "--allow-root",
    "--ServerApp.token=colab123",
    "--ServerApp.allow_remote_access=True",
    "--ServerApp.allow_origin='*'",
    "--ServerApp.disable_check_xsrf=True",
    "--NotebookApp.token=colab123",
    "--NotebookApp.allow_remote_access=True",
    "--NotebookApp.allow_origin='*'",
    "--NotebookApp.disable_check_xsrf=True"
])
time.sleep(2)

# Expose Jupyter over Cloudflare HTTPS/WSS quick tunnel
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
        print(f"In Neovim run: :ColabConnect {url}/?token=colab123")
        break

2. In Neovim:
--------------------------------------------------
# Connect directly:
:ColabConnect https://<YOUR-COLAB-SUBDOMAIN>.trycloudflare.com/?token=colab123

# Keymaps in buffer:
<leader>ml - Evaluate Line
<leader>me - Evaluate Operator
<leader>mr - Re-evaluate Cell
<leader>mv - Evaluate Visual
<leader>mo - Show Output Window
<leader>mh - Hide Output Window
"""
