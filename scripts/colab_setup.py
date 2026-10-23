"""
Google Colab Bridge for Neovim (WezTerm + Molten + Cloudflare Tunnel)
-----------------------------------------------------------------------
Run this script inside a cell on your Google Colab notebook:

1. Setup Colab environment:
--------------------------------------------------
!pip install colab_ssh jupyter --upgrade

2. Start Cloudflare SSH Tunnel and Jupyter Server:
--------------------------------------------------
from colab_ssh import launch_ssh_cloudflared
import subprocess, time

# Set a password for your SSH tunnel
launch_ssh_cloudflared(password="colab123")

# Launch headless Jupyter server on port 8888
subprocess.Popen([
    "jupyter", "notebook",
    "--ip=127.0.0.1",
    "--port=8888",
    "--no-browser",
    "--allow-root",
    "--NotebookApp.token=colab123",
    "--NotebookApp.allow_origin='*'"
])

print("Colab Jupyter Server running on 127.0.0.1:8888 with token: colab123")

3. On your local machine (in WezTerm / Terminal):
--------------------------------------------------
# Forward port 8888 through Cloudflare tunnel (replace <HOSTNAME> from colab-ssh output).
# Note: omit '-N' so the password prompt ('colab123') triggers immediately:
ssh -L 8888:127.0.0.1:8888 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="cloudflared access ssh --hostname <HOSTNAME>" root@<HOSTNAME>

4. In Neovim:
--------------------------------------------------
# Connect to the remote Colab kernel:
:ColabConnect http://localhost:8888/?token=colab123
# Or use keymap:
<leader>mc
"""
