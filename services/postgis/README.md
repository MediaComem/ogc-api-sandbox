# Demo service for postgis


Runs PostGIS with PGAdmin4.

* Docker Image: postgis/postgis:14-3.2-alpine - Postgres v14.1 with PostGIS 3.2 on Alpine Linux
* PGAdmin4 Image: dpage/pgadmin4:6.8

TODO: we need to securely deal with pg.env and pgadmin.env (Docker secrets?)

## Deployment

This service is automatically (re)deployed if anything within this directory or its subdirs changes
when committed/pushed.

A GitHub Action invokes an Ansible Playbook.
See the following deployment files:

* [GitHub Action](../../.github/workflows/deploy.postgis.yml)
* [Ansible Playbook](../../ansible/deploy.yml)

The Ansible Playbook can also be invoked directly.
