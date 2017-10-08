.PHONY: run
run:
	docker run -d -p 127.0.0.1:3000:3000 --env-file=.env --restart=always -ti polr

.PHONY: build
build:
	docker build -t polr .
