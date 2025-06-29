#!/bin/bash

echo "🚀 Installing Shakib Panel..."

apt update && apt upgrade -y
apt install -y php php-cli php-fpm php-mysql php-mbstring php-xml php-curl php-bcmath unzip git nginx mysql-server curl composer

chown -R www-data:www-data .
chmod -R 755 storage bootstrap/cache

composer install --no-dev --optimize-autoloader

# Set up .env if not exists
if [ ! -f .env ]; then
    echo "🔧 Creating .env file..."
    cp .env.example .env
    php artisan key:generate
    echo "⚠️ Please edit the .env file and set your database credentials."
    echo "Then run: php artisan migrate --seed --force"
else
    echo "✅ .env file already exists. Skipping .env setup."
fi

echo ""
echo "✅ Installation complete!"
