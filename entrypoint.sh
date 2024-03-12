#!/bin/sh -l

image="$1"
app_name="$2"
namespace="$3"
expose_port="$4"

gke-deploy run -i $image -a $app_name -n $namespace -x $expose_port
