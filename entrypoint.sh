#!/bin/sh -l

image="$1"
app_name="$2"
region="$3"
cluster_name="$4"
project_id="$5"
namespace="$6"
expose_port="$7"

gke-deploy run -i $image -a $app_name -l $region -c $cluster_name -p $project_id -n $namespace -x $expose_port
