#!/bin/bash

#exec &> /tmp/logfile.txt

export HOME=/config

sleep 1

filebot -script fn:amc \
	--output "/data/videos/" \
	--db anidb
	--def animeFormat="Anime/{n}/{n}.S{(episode.season ? s : 1).pad(2)}E{e.pad(2)}.{t}" \
	--def movieFormat="Movies/{n} ({y})/{n} ({y})" \
	--log-file amc.log \
	--action copy \
	-non-strict "/data/torrents/completed" \
	--def excludeList=amc.txt \
	--def "exec=chown 1000:1000 -R '{output}'"

