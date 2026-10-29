# GitOps manifests

Copy this directory into the root of `https://github.com/mahiavi/devops-app.git` and commit it to `main`.

Before committing, replace `ACCOUNT_ID` and `REGION` in `k8s/deployment.yaml` with the real AWS account ID and ECR region. The image tag `1.0` must exist in ECR.

The readiness/liveness/startup probes use Spring Boot Actuator endpoints. Add `spring-boot-starter-actuator` and configure Kubernetes health probes if your app does not currently expose these endpoints. Otherwise, change the probe paths to endpoints that actually return HTTP 200.

`argocd/application.yaml` enables automatic sync and self-healing. It does not detect new tags in ECR by itself: commit the desired image tag to Git to trigger a rollout.
