IMAGE_NAME ?= opendronemap/opendronemap

default: staging/code
	docker build --rm -t mojodna/opendronemap-minimal .

staging/code:
	docker run --rm -v $$(pwd)/staging:/tmp/staging --entrypoint /bin/cp $(IMAGE_NAME) -r /code/ /tmp/staging/
	sudo chown -R $$(whoami):$$(whoami) staging/code

clean:
	rm -rf staging/code
