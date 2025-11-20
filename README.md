# Minimum Reproducible Example | Build Secret Corruption

I've been running into an issue with mounting a zip file as a build secret using
the `docker/build-push-action`. This repo is an attempt at replicating the issue
in a minimally reproducible way.

Essentially, I have a "complier" that requires a license which takes the form of
a zip file. When mounting the zip file via the docker/build-push-action, the
underlying implementation uses docker/actions-toolkit to copy the provided
secrets files to a temporary location before actually calling the docker build
command. I suspect it's this step that is somehow causing corruption of the zip
file license.

My expectation is that a build secret provided as a file is _byte-for-byte_
identical on the host file system as it is within the build when mounted as a
secret. Using a SHA256 digest can demonstrate the file being changed.
