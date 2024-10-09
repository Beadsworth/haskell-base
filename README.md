Base image with ghcup for haskell projects.

To create a builder:

```
docker buildx create \
  --name container \
  --driver=docker-container
```