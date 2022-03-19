.PHONY: bat
bat: bat/build.sh bat/Dockerfile
	./bat/build.sh

yt-dl/mikenye:
	curl -s https://api.github.com/repos/mikenye/docker-youtube-dl | \
	jq -r '.updated_at' > $@

.PHONY: yt-dl
yt-dl: yt-dl/build.sh yt-dl/mikenye
	./yt-dl/build.sh
