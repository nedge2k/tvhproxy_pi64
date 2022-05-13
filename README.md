# tvhproxy_pi64
Dockerfile for 64-bit Pi 4 to run tvhproxy, a python script which allows a tvheadend server to appear as a hdhomerun server, allowing software like plex to use it.

To build the docker image...

cd /tmp
mkdir tvhproxy_pi64
nano Dockerfile (paste in the contents)
sudo docker build -t "tvhproxy_pi64:latest" .

then to run the container....

sudo docker run -d \
  --name tvhproxy_pi64 \
  --net=host \
  -e TVH_TUNER_COUNT=1 \
  -e TVH_PROFILE=pass \
  -e TVH_URL="http://YOURIP:9981" \
  -e TVH_PROXY_URL="http://YOURIP:5004" \
tvhproxy_pi64

inclusion of the http/https in the url envar is critical - python script won't work otherwise

side note: uk people, turn off transcoding in the tuner setup (i.e. set it to "original" quality otherwise BBC channels have no video in some clients)
further side note: you don't need this for the Pi TV hat, it works in plex BUT, plex has issues tuning certain DVB-T2 muxes in the UK and there's no way to set the constellation etc.
