.PHONY: run
run: build
	docker run -d -p 127.0.0.1:3000:3000 -v `pwd`/db:/app/db --env-file=.env --restart=always -ti polr

.PHONY: build
build:
	docker build -t polr .
