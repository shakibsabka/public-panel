cp .env.example .env
php artisan key:generate
# Edit your .env DB settings
php artisan migrate --seed --force
