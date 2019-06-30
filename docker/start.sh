#!/bin/sh

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

if [ "$role" = "phptutorial_app" ]; then
    echo "Running php..."
    exec php-fpm

# elif [ "$role" = "app_queue" ]; then

#     echo "Running the queue..."
#     php /var/www/html/artisan queue:work --verbose --tries=3 --timeout=90

# elif [ "$role" = "app_scheduler" ]; then

#     echo "Running the scheduler..."
#     while [ true ]
#     do
#       php /var/www/html/artisan schedule:run --verbose --no-interaction &
#       sleep 60
#     done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi