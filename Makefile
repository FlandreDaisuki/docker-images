.PHONY: bat
bat: bat/build.sh bat/Dockerfile
	./bat/build.sh

.PHONY: tmpmail
tmpmail:
	./tmpmail/build.sh
