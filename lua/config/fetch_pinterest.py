import os
import random
import re
import io
import urllib.request
import xml.etree.ElementTree as ET
from PIL import Image

PIXEL_ART_FEEDS = [
    "https://www.pinterest.com/pixellandscape/feed.rss",
    "https://www.pinterest.com/pixelscenery/feed.rss",
    "https://www.pinterest.com/pixelcity/feed.rss",
    "https://www.pinterest.com/pixelnostalgia/feed.rss",
    "https://www.pinterest.com/aestheticpixels/feed.rss",
    "https://www.pinterest.com/pixel_aesthetic/feed.rss",
    "https://www.pinterest.com/pixel_dreams/feed.rss",
    "https://www.pinterest.com/pixelplace/feed.rss",
    "https://www.pinterest.com/pixelvibes/feed.rss",
    "https://www.pinterest.com/pixelcore/feed.rss",
    "https://www.pinterest.com/pixelworld/feed.rss",
    "https://www.pinterest.com/pixelart/feed.rss",
]

def fetch_pins():
    cache_dir = os.path.expandvars(r"%LOCALAPPDATA%\nvim-data\pinterest_cache")
    os.makedirs(cache_dir, exist_ok=True)

    img_urls = set()
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}

    # Gather pin URLs from pixel art feeds
    for feed in PIXEL_ART_FEEDS:
        try:
            req = urllib.request.Request(feed, headers=headers)
            with urllib.request.urlopen(req, timeout=5) as resp:
                root = ET.fromstring(resp.read())
                for item in root.findall(".//item"):
                    desc = item.find("description")
                    txt = desc.text if desc is not None and desc.text else ""
                    m = re.search(r'src="([^"]+)"', txt)
                    if m:
                        img_urls.add(m.group(1).replace("/236x/", "/736x/"))
        except Exception:
            continue

    if not img_urls:
        print("No pins found.")
        return

    url_list = list(img_urls)
    random.shuffle(url_list)

    # Download only true LANDSCAPE images (width >= height)
    count = 0
    target_count = 30
    for img_url in url_list:
        if count >= target_count:
            break
        try:
            req = urllib.request.Request(img_url, headers=headers)
            with urllib.request.urlopen(req, timeout=6) as r:
                data = r.read()
            im = Image.open(io.BytesIO(data))
            w, h = im.size
            # Only keep landscape images (width must be at least as wide as height)
            if w < h:
                continue

            ext = img_url.split(".")[-1].split("?")[0]
            if ext not in ["jpg", "jpeg", "png", "webp"]:
                ext = "jpg"
            out_path = os.path.join(cache_dir, f"pixel_landscape_{count+1}.{ext}")
            with open(out_path, "wb") as f:
                f.write(data)
            count += 1
            print(f"Saved landscape {count}: {w}x{h}")
        except Exception:
            pass

    print(f"Successfully cached {count} landscape pixel art pins.")

if __name__ == "__main__":
    fetch_pins()
