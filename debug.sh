#!/bin/sh
echo "This takes a few seconds to spool up, be patient"
echo
exec kubectl run --rm -i --tty ubuntu --overrides='
{
    "apiVersion": "v1",
    "kind": "Pod",
    "metadata": {
        "creationTimestamp": null,
        "labels": {
            "run": "ubuntu"
        },
        "name": "ubuntu"
    },
    "spec": {
        "containers": [
            {
                "args": [
                    "bash"
                ],
                "image": "ubuntu:latest",
                "name": "ubuntu",
                "resources": {},
                "stdin": true,
                "stdinOnce": true,
                "tty": true,
                "volumeMounts": [
                    {
                        "mountPath": "/data",
                        "name": "data",
                        "subPath": "repo-digest"
                    }
                ]
            }
        ],
        "dnsPolicy": "ClusterFirst",
        "restartPolicy": "Never",
        "volumes": [
            {
                "name": "data",
                "persistentVolumeClaim": {
                    "claimName": "roachdash-claim"
                }
            }
        ]
    },
    "status": {}
}
' --image ubuntu:latest --restart=Never -- bash
