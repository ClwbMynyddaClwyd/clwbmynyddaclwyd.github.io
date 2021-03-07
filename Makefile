default: install

h help:
	@grep '^[a-z]' Makefile

install:
	cd site && bundle config set --local path ../vendor/bundle
	cd site && bundle install --jobs 8

s serve:
	cd site && \
		bundle exec jekyll serve --destination ../build/ \
		--verbose --livereload --incremental

.PHONY: build
build:
	cd site && \
		JEKYLL_ENV=production bundle exec jekyll build -d ../build --trace
