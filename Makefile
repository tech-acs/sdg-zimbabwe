install:
	pip install -r requirements.txt --upgrade
	bundle install

build: build.data build.site

build.production: build.data build.site.production

build.data:
	python scripts/build_data.py

build.site:
	bundle exec jekyll build --config=_config.yml

build.site.production:
	bundle exec jekyll build --config=_config.yml,_config_prod.yml

serve: build
	bundle exec jekyll serve --config=_config.yml --skip-initial-build

test: test.data test.site

test.data:
	python scripts/check_data.py

test.site: build
	sh scripts/check_site.sh
