python-docker-nginx
===================

Checklist
---------

Local
^^^^^

* Run project locally by starting up redis and postgres containers:

::

    make local-init

* Run migrations:

::

    python manage.py makemigrations
    python manage.py migrate

* Run server locally:

::

    python manage.py runserver


Production
^^^^^^^^^^

* Configure all environment files in .envs/.production/

* Configure all service*.conf files in compose/production/nginx

* Setup docker and docker-compose in the host machine by running, inside this folder:

::

    ./setup

* Build and run all service containers (Postgres, Django, Redis, run migrate ...)

::

    make init

* Create superuser

::

    make createsuperuser


Basic Commands
--------------

Still working on command descriptions, but you cant take a look on Makefile


Sentry
^^^^^^

Sentry is used for tracking errors.. This project, when using its defaults, has
sentry enabled, but you will have to setup the dsn on environment file.
You must register here first: https://sentry.io/signup/

