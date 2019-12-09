# K8s Readiness Tester

This is a container that alternates between failing & succeeding K8s readiness probes on a specified interval.

Add this container to your pod like so:

```yaml
- image: milesmatthias/readiness-ruby-test:latest
  imagePullPolicy: Always
  name: ruby-readiness-tester
  env:
  - name: INTERVAL_SECONDS
    value: "120"
  ports:
  - containerPort: 5678
    name: readiness-test
    protocol: TCP
  readinessProbe:
    failureThreshold: 3
    httpGet:
      path: /
      port: 5678
      scheme: HTTP
    initialDelaySeconds: 5
    periodSeconds: 1
    successThreshold: 1
    timeoutSeconds: 1
```

Use this to test your application's resiliance to individual pods becoming unavailable in your service.
