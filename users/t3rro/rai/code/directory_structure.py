#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python3Packages.toml

import toml
import subprocess
import os

with open("repos.toml", "r") as config_file:
    config = config_file.read()
    config = toml.loads(config)

for repo in config["repositories"]:
    if not os.path.exists(repo["subdir"]):
        cmd = ["git", "clone", "--branch", repo["branch"], repo["url"], repo["subdir"]]
        subprocess.run(cmd)
