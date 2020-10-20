package k8sallowedrepos

test_input_allowed_container {
    input := { "review": allowed, "parameters": {"namespaces": ["default"]}}
    results := violation with input as input
    count(results) == 0
}
test_input_blocked_container {
    input := { "review": blocked, "parameters": {"namespaces": ["default"]}}
    results := violation with input as input
    count(results) == 1
}

blocked = {
    "object": {
        "metadata": {
            "name": "nginx",
            "namespace": "default"
        },
    }
}

allowed = {
    "object": {
        "metadata": {
            "name": "nginx",
            "namespace": "my-nginx"
        },
    }
}
