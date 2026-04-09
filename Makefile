# Individual Development Plan - Monorepo Makefile

.PHONY: setup db-setup db-migrate server web test check

setup:
	cd api && bundle install
	cd web && npm install
	cd mobile && npm install

db-setup:
	cd api && bundle exec rake db:create db:migrate

db-migrate:
	cd api && bundle exec rake db:migrate

server:
	cd api && bundle exec puma

web:
	cd web && npm run dev

test:
	cd api && bundle exec rspec

check:
	cd api && bundle exec rubocop
	cd web && npm run lint
	cd mobile && npm run lint
