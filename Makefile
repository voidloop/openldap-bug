PYTHON ?= python
VENV ?= .venv
PIP := ${VENV}/bin/pip

submodules:
	git submodule update --init --recursive
.PHONY: submodules

$(VENV):
	${PYTHON} -m venv ${VENV}
	${PIP} install -q -U pip setuptools pytest ldap3

venv: | $(VENV)
.PHONY: env

#-------------------------------------------------------------------------------
# Docker
#-------------------------------------------------------------------------------
docker-run:
	docker compose -f compose.yml up --remove-orphans
.PHONY: docker-run

docker-clean:
	docker compose -f compose.yml down --volumes
	docker compose -f compose.yml rm -f
.PHONY: docker-clean

upstream-shell:
	docker compose -f compose.yml exec upstream /bin/bash
.PHONY: upstream-shell
