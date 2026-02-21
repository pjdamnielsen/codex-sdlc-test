#!/usr/bin/env python3
import base64
import html
import json
import os
import sys
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFLUENCE_DIR = ROOT / "docs" / "confluence"

PAGES = [
    ("SDLC Space Home", "00-SPACE-HOME.md", None),
    ("SDLC Prosess", "10-SDLC-PROCESS.md", "SDLC Space Home"),
    ("Arkitektur", "20-ARCHITECTURE.md", "SDLC Space Home"),
    ("ADR Template", "30-ADR-TEMPLATE.md", "SDLC Space Home"),
    ("Runbook Incident", "40-RUNBOOK-INCIDENT.md", "SDLC Space Home"),
    ("Onboarding", "50-ONBOARDING.md", "SDLC Space Home"),
    ("Retrospektiv Mal", "60-RETRO-TEMPLATE.md", "SDLC Space Home"),
    ("Delivery Contract", "70-DELIVERY-CONTRACT.md", "SDLC Space Home"),
]


def must_env(name: str) -> str:
    value = os.getenv(name, "").strip()
    if not value:
        print(f"Missing required env var: {name}", file=sys.stderr)
        sys.exit(1)
    return value


BASE_URL = must_env("CONFLUENCE_BASE_URL").rstrip("/")
EMAIL = must_env("CONFLUENCE_EMAIL")
API_TOKEN = must_env("CONFLUENCE_API_TOKEN")
SPACE_KEY = must_env("CONFLUENCE_SPACE_KEY")

AUTH = base64.b64encode(f"{EMAIL}:{API_TOKEN}".encode()).decode()
HEADERS = {
    "Authorization": f"Basic {AUTH}",
    "Accept": "application/json",
    "Content-Type": "application/json",
}


def request_json(method: str, path: str, data=None):
    url = f"{BASE_URL}{path}"
    body = None if data is None else json.dumps(data).encode("utf-8")
    req = urllib.request.Request(url, data=body, method=method, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=30) as resp:
        return json.loads(resp.read().decode("utf-8"))


def get_page(title: str):
    query_title = urllib.parse.quote(title)
    query_space = urllib.parse.quote(SPACE_KEY)
    path = f"/rest/api/content?spaceKey={query_space}&title={query_title}&expand=version"
    out = request_json("GET", path)
    results = out.get("results", [])
    return results[0] if results else None


def to_storage_value(path: Path) -> str:
    text = path.read_text(encoding="utf-8")
    return f"<pre>{html.escape(text)}</pre>"


def upsert_page(title: str, file_name: str, parent_id=None) -> str:
    storage_value = to_storage_value(CONFLUENCE_DIR / file_name)
    existing = get_page(title)

    if not existing:
        payload = {
            "type": "page",
            "title": title,
            "space": {"key": SPACE_KEY},
            "body": {
                "storage": {
                    "value": storage_value,
                    "representation": "storage",
                }
            },
        }
        if parent_id:
            payload["ancestors"] = [{"id": str(parent_id)}]

        created = request_json("POST", "/rest/api/content", payload)
        return str(created["id"])

    page_id = str(existing["id"])
    new_version = int(existing["version"]["number"]) + 1

    payload = {
        "id": page_id,
        "type": "page",
        "title": title,
        "version": {"number": new_version},
        "body": {
            "storage": {
                "value": storage_value,
                "representation": "storage",
            }
        },
    }
    if parent_id:
        payload["ancestors"] = [{"id": str(parent_id)}]

    request_json("PUT", f"/rest/api/content/{page_id}", payload)
    return page_id


def main() -> int:
    ids = {}
    for title, filename, parent_title in PAGES:
        parent_id = ids.get(parent_title) if parent_title else None
        page_id = upsert_page(title, filename, parent_id)
        ids[title] = page_id
        print(f"Synced: {title} -> {page_id}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
