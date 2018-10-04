#!/bin/bash

export HOME=/config

sleep 1

filebot -script fn:amc \
	--db thetvdb \
	--output "/data/videos/" \
	--def movieFormat="Movies/{n} ({y})/{n} ({y})" \
	--def seriesFormat="Anime/{n}/{'Season '+s}/{n} - {s00e00} - {t}" \
	--log-file amc.log \
	--action copy \
	-non-strict "/data/torrents/completed" \
	--def excludeList=amc.txt \
	--def "exec=chown 1000:1000 -R '{output}'"
