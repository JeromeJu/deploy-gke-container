FROM us-docker.pkg.dev/gcb-catalog-release/preview/gke-deploy@sha256:a85701dedd45e7c3995a09cce83ec307a591525b782038dcd5cf7c2811464cb7 as gke-deploy


# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]