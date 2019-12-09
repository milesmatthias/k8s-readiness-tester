IMG=milesmatthias/readiness-ruby-test

run: 
	ruby server.rb

build:
	docker build -t $(IMG):latest .

release: build
	docker push $(IMG):latest

docker-run: build
	docker run $(IMG):latest
