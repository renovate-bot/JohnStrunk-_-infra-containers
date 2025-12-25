---
applyTo: "**"
---

# Repository structure

- This repository is a collection of container images for various applications
  and services.
- Each application or service has its own directory at the root level of the
  repository, and the name of the directory corresponds to the name of the
  container image that will be built from that directory.
- Each application or service directory contains a `Dockerfile` that defines
  how to build the container image for that application or service. Each
  container can be built via:

  ```console
  cd <container-directory>
  docker build -t <image-name> .
  ```

- The final containers are built and pushed to a container registry via a
  CI/CD pipeline defined in `.github/workflows/ci-workflow.yaml`. When
  creating or removing container images, ensure that the CI/CD workflow is
  updated accordingly by adjusting the list of container directories in the
  matrix build step.
