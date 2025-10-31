# Kubernetes Common Errors and explanation

🔁 CrashLoopBackOff
This means your pod starts, crashes, and Kubernetes keeps trying to restart it.
🔍 Check container logs using kubectl logs <pod> --previous to debug startup issues or failing health checks.

📦 ImagePullBackOff / ErrImagePull
Kubernetes can’t pull your container image: often due to a wrong image name, missing tag, or lack of access to a private registry.
✅ Double-check the image URL and credentials (if private).

⏳ Pending
Your pod is stuck in "Pending" state because the scheduler can’t find a suitable node.
🔍 This usually happens due to insufficient resources or missing tolerations/node selectors.

⚠️ RunContainerError
The pod gets created but the container fails to run: often caused by incorrect entrypoint commands or missing files.
✅ Review your Dockerfile CMD/ENTRYPOINT and the pod's command and args.

🚫 CreateContainerConfigError
Kubernetes can’t create the container due to a config error: often related to missing Secrets, ConfigMaps, or invalid volume mounts.
🔍 Use kubectl describe pod <pod> to inspect what’s going wrong.

🔐 SecretNotFound / ConfigMapNotFound
Your pod references a missing Secret or ConfigMap.
✅ Make sure the secret/configmap exists in the same namespace and is correctly referenced in your manifest.

🧠 OOMKilled (Out of Memory)
Your container used more memory than requested or allowed, and got killed.
🔍 Fix by adjusting the memory limits in your pod spec or optimizing the app’s memory usage.

🌐 DNSResolutionFailed
Pod fails to resolve internal or external service names.
✅ Check if kube-dns or CoreDNS is running correctly and verify the DNS configuration in your pod.

📉 LivenessProbe Failed
K8s restarts your container because the liveness probe fails continuously.
🔍 Review the probe settings and ensure the endpoint/command returns the right status code.

🔄 NodeNotReady / NodeLost
 Pods get evicted or stuck due to a node going down or being unreachable.
 ✅ Monitor node health (kubectl get nodes), and check logs for network or disk issues
