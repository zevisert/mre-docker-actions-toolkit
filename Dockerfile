# syntax=docker/dockerfile:1

FROM debian:trixie-slim

# In the real example, we install build tools, COPY files in, then
# perform the build with the license activated. But our issue is that
# docker/build-push-action (actually docker/actions-toolkit) seems to
# be corrupting the license file. So, for this MRE, just check that
# the SHA digest is expected.
COPY <<EOF license.sha256sum
7728f8ac3099aa4045039f5c7d74d7ea54e5f68f43dc9312ab69201a88730c97 *license.zip
EOF

RUN --mount=type=secret,id=sample-license,required=true,target=license.zip \
  sha256sum --check license.sha256sum 

