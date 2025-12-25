---
applyTo: "**/Dockerfile"
---

# Dockerfile rules

- Use minimal base images to reduce image size and attack surface.
- Use multi-stage builds to optimize the final image.
- After editing a Dockerfile, always use `hadolint` to check for best
  practices and common mistakes. Fix any issues reported by `hadolint`.

## Linting exceptions

- Use `# hadolint ignore=DL3008` or `DL3018` to ignore warnings about pinning
  specific package versions when installing packages with `apt-get` or similar
  package managers.
