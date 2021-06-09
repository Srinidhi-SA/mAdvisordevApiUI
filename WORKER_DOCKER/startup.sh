#!/bin/sh

sleep 3s
celery worker -A config.celery --beat --scheduler 'django_celery_beat.schedulers:DatabaseScheduler' -l info