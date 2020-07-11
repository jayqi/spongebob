.PHONY: build clean clean-build clean-test lint test

build: clean
	python setup.py sdist bdist_wheel

clean: clean-build clean-test

clean-build:
	find . -name *.pyc -delete && find . -name __pycache__ -delete
	rm -rf build
	rm -rf dist
	rm -rf spongebobcase.egg-info

clean-docs:
	rm -rf docs/site

clean-test:
	rm -f .coverage
	rm -f coverage.xml
	rm -rf htmlcov/
	rm -rf .pytest_cache

docs: clean-docs
	cp README.md docs/docs/index.md
	cd docs && mkdocs build

lint:
	black --check spongebobcase tests
	flake8 spongebobcase tests

test:
	pytest -vv
