#!/bin/sh -l

gha_version="0.1.0"

image="$1"
app_name="$2"
location="$3"
cluster_name="$4"
project_id="$5"
namespace="$6"
expose_port="$7"

if [ -z "$image" ] || [ -z "$app_name" ] || [ -z "$location" ] || [ -z "$cluster_name" ] || [ -z "$project_id" ]; then
  echo "Error: Required variables (image, app_name, location, cluster_name, project_id) are not set."
  exit 1
fi

# Utilize Google APIs user agent for metrics with the following unique identifier:
export GOOGLE_APIS_USER_AGENT=google-github-action:deploy-gke/$gha_version

if [ -z "$namespace" ] && [ -z "$expose_port" ]; then
  gke-deploy run -i "$image" -a "$app_name" -l "$location" -c "$cluster_name" -p "$project_id"
elif [ -z "$namespace" ] && [ -n "$expose_port" ]; then 
  gke-deploy run -i "$image" -a "$app_name" -l "$location" -c "$cluster_name" -p "$project_id" -x "$expose_port" 
elif [ -n "$namespace" ] && [ -z "$expose_port" ]; then 
  gke-deploy run -i "$image" -a "$app_name" -l "$location" -c "$cluster_name" -p "$project_id" -n "$namespace"
else
  gke-deploy run -i "$image" -a "$app_name" -l "$location" -c "$cluster_name" -p "$project_id" -n "$namespace" -x "$expose_port" 
fi
