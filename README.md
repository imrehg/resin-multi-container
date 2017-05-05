# resin.io multi containers example.

**THIS IS WORK IN PROGRESS**

The application starts a docker-in-docker instance and runs docker-compose.
docker-compose then builds and runs the containers.

You can edit docker-compose.yml to add the containers you need.

For docker in docker, check [jpetazzo/dind](https://github.com/jpetazzo/dind).

## Usage notes

The example creats a Trasmission Bittorrent client and a static webserver.
To try it out, push this to your resin.io device, and access the Transmission
server through the `http://<device IP>:9091` and the static server (that shows
the files you've downloaded with Transmission) at `http://<device IP>/`.
Instead of `http://<device IP>` on resinOS 2.0 you might use the
`htt://<short UUID>.local` format, where the `<short UUID>` is the first 7
characters of your device's UUID (which you can get e.g. from the dashboard).
