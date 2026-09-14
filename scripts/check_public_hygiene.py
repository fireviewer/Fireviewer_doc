#!/usr/bin/env python3
from pathlib import Path
import re
import subprocess
import sys


def tracked_files():
    raw = subprocess.check_output(["git", "ls-files", "-z"])
    return [Path(item.decode("utf-8")) for item in raw.split(b"\0") if item]


ALLOWED_NAMES = {".env.example"}
BLOCKED_NAMES = {".npmrc", ".pypirc", ".netrc"}
BLOCKED_SUFFIXES = {
    ".pem", ".key", ".p12", ".pfx", ".jks", ".keystore",
    ".tfstate", ".ovpn", ".mobileprovision", ".provisionprofile",
    ".log", ".zip", ".tar", ".7z", ".ckpt", ".onnx", ".pt",
    ".pth", ".safetensors",
}
BLOCKED_PREFIXES = (
    "id_rsa", "id_ed25519", "credentials", "service-account",
    "service_account", "kubeconfig",
)

TEXT_PATTERNS = (
    ("deployment identifier", re.compile(r"\bdpl_[A-Za-z0-9]{12,}\b")),
    ("Windows user path", re.compile(r"[A-Za-z]:\\\\Users\\\\[^\\\\\s]+\\\\")),
    ("macOS user path", re.compile(r"/Users/[^/\s]+/")),
    ("Linux user path", re.compile(r"/home/[^/\s]+/")),
)


def blocked_path(path: Path):
    name = path.name.lower()
    if name in ALLOWED_NAMES:
        return False
    if name == ".env" or name.startswith(".env."):
        return True
    if name in BLOCKED_NAMES:
        return True
    if any(name.startswith(prefix) for prefix in BLOCKED_PREFIXES):
        return True
    if ".tfstate." in name:
        return True
    return any(name.endswith(suffix) for suffix in BLOCKED_SUFFIXES)


def main():
    errors = []
    for path in tracked_files():
        if blocked_path(path):
            errors.append(f"blocked tracked file: {path}")
            continue
        try:
            data = path.read_bytes()
        except OSError:
            continue
        if len(data) > 2_000_000 or b"\0" in data:
            continue
        try:
            text = data.decode("utf-8")
        except UnicodeDecodeError:
            continue
        for label, pattern in TEXT_PATTERNS:
            if pattern.search(text):
                errors.append(f"{label} found in: {path}")

    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        return 1

    print("Public repository hygiene check passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
