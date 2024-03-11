FROM us-docker.pkg.dev/gcb-catalog-release/preview/gke-deploy@sha256:a85701dedd45e7c3995a09cce83ec307a591525b782038dcd5cf7c2811464cb7 as gke-deploy

USER root

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
