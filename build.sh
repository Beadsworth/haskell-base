#!/bin/bash
set -euo pipefail

repo_name="beadsworth"
image_name="haskell-base"
image_tag="latest"

docker buildx build \
    -t "$repo_name/$image_name:$image_tag" \
    --platform linux/amd64,linux/arm64 \
    --builder container \
    --push .
