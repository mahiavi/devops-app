
package com.devops.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return """
                <html>
                <head>
                    <title>DevOps CI/CD Project</title>
                </head>
                <body>
                    <h1>Welcome to DevOps CI/CD!</h1>
                    <p>Java application deployed using Jenkins,
                    Docker, Kubernetes and Argo CD.</p>
                </body>
                </html>
                """;
    }

    @GetMapping("/api")
    public String api() {
        return "Java application is running successfully!";
    }

    @GetMapping("/api/version")
    public String version() {
        return "Version: 1.0.0";
    }
}

