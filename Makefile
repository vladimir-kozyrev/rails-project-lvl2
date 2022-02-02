setup:
	bin/setup
	bin/rails db:seed

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

test:
	NODE_ENV=test bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views

full_check: test lint

.PHONY: test
