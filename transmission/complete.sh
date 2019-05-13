#!/bin/bash

export HOME=/config
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

sleep 1

filebot --license /config/*.psm

filebot -script fn:amc \
	--def ut_label=anime \
	--output "/data/videos/" \
	--def seriesFormat="{plex}" \
	--log-file amc.log \
	--action copy \
	-non-strict "/data/torrents/complete/Anime" \
	--def excludeList=amc.txt \
	--def "exec=chown 1000:1000 -R '{output}'"

filebot -script fn:amc \
	--def ut_label=movies \
	--output "/data/videos/" \
	--def movieFormat="{plex}" \
	--log-file amc.log \
	--action copy \
	-non-strict "/data/torrents/complete/TVSeries" \
	--def excludeList=amc.txt \
	--def "exec=chown 1000:1000 -R '{output}'"

filebot -script fn:amc \
	--def ut_label=tv \
	--output "/data/videos/" \
	--def seriesFormat="{plex}" \
	--log-file amc.log \
	--action copy \
	-non-strict "/data/torrents/complete/Movies" \
	--def excludeList=amc.txt \
	--def "exec=chown 1000:1000 -R '{output}'"
