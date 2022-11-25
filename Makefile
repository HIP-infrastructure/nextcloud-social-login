.DEFAULT_GOAL := help

#dep: @ Install all depencies defined in package.json
dep:
	npm install

#dep.init: @ Install all depencies for Ubuntu
dep.init:
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	sudo apt-get install -y nodejs

#build: @ Builds the project
build: dep b.bundle

#b.bundle: @ Builds the application as a JavaScript bundle
b.bundle:
	npm run build

#help:	@ List available tasks on this project
help:
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(MAKEFILE_LIST)| tr -d '#'  | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

