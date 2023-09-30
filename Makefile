include .env

.PHONY: set-git-variables 

up:
	kind create cluster --name flux-project

down:
	kind delete cluster --name flux-project

set-kind-context:
	kubectl cluster-info --context kind-flux-project

set-git-variables:
	export GITHUB_USER=${GITHUB_USER} ; export GITHUB_TOKEN=${GITHUB_TOKEN}

bootstrap-flux:
	flux bootstrap github \
	--owner=${GITHUB_USER} \
	--repository=fleet-infra \
	--branch=main \
	--path=./clusters/local \
	--personal
