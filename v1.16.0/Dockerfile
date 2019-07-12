ARG VERSION=v1.15.0
FROM netdata/netdata:${VERSION}


# Add Configurations
# GO
COPY --chown=root:netdata files/etc/netdata/go.d/apache.conf /etc/netdata/go.d/
COPY --chown=root:netdata files/etc/netdata/go.d/httpcheck.conf /etc/netdata/go.d/
COPY --chown=root:netdata files/etc/netdata/go.d/mysql.conf /etc/netdata/go.d/
COPY --chown=root:netdata files/etc/netdata/go.d/nginx.conf /etc/netdata/go.d/
# PYTHON
COPY --chown=root:netdata files/etc/netdata/python.d/redis.conf /etc/netdata/python.d/
# MAIN
COPY --chown=root:netdata files/etc/netdata/health_alarm_notify.conf /etc/netdata/
COPY --chown=root:netdata files/etc/netdata/netdata.conf /etc/netdata/
COPY --chown=root:netdata files/etc/netdata/go.d.conf /etc/netdata/
COPY --chown=root:netdata files/etc/netdata/python.d.conf /etc/netdata/
# Entrypoint
COPY --chown=root:netdata files/entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

#     Variables for Labels:
ARG VENDOR="DCSO GmbH"
ARG COMPONENT="db"
ARG BUILD_DATE
ARG GIT_REPO
ARG VCS_REF
ARG VERSION
ARG MISP_TAG=${VERSION}
ARG RELEASE_DATE
ARG NAME="MISP-dockerized-${COMPONENT}"
ARG DESCRIPTION="This docker container is part of the DCSO MISP dockerized environment."
ARG DOCUMENTATION="https://github.com/DCSO/MISP-dockerized"
ARG AUTHOR="DCSO MISP Docker Team <misp.docker@dcso.de>"
ARG LICENSE="BSD-3-Clause"
#     END Variables

#########################################
LABEL org.label-schema.build-date="${BUILD_DATE}" \
        org.label-schema.name="${NAME}" \
        org.label-schema.description="${DESCRIPTION}" \
        org.label-schema.vcs-ref="${VCS_REF}" \
        org.label-schema.vcs-url="${GIT_REPO}" \
        org.label-schema.url="${GIT_REPO}" \
        org.label-schema.vendor="${VENDOR}" \
        org.label-schema.version="${VERSION}" \
        org.label-schema.usage="${DOCUMENTATION}" \
        org.label-schema.schema-version="1.0.0-rc1"

LABEL   org.opencontainers.image.created="${BUILD_DATE}" \
        org.opencontainers.image.url="${GIT_REPO}" \
        org.opencontainers.image.source="${GIT_REPO}" \
        org.opencontainers.image.version="${VERSION}" \
        org.opencontainers.image.revision="${VCS_REF}" \
        org.opencontainers.image.vendor="${VENDOR}" \
        org.opencontainers.image.title="${NAME}" \
        org.opencontainers.image.description="${DESCRIPTION}" \
        org.opencontainers.image.documentation="${DOCUMENTATION}" \
        org.opencontainers.image.authors="${AUTHOR}" \
        org.opencontainers.image.licenses="${LICENSE}"
#########################################
