#!/bin/bash -e

composer create-project --repository-url=https://repo.magento.com/ --no-install magento/project-community-edition="$MAGENTO_VERSION" /var/www/html
composer config --no-plugins allow-plugins.laminas/laminas-dependency-plugin true
composer config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true
composer config --no-plugins allow-plugins.magento/composer-root-update-plugin true
composer config --no-plugins allow-plugins.magento/inventory-composer-installer true
composer config --no-plugins allow-plugins.magento/magento-composer-installer true
composer install

cd /var/www/html

# Install Magento
php bin/magento setup:install \
    --base-url=$MAGENTO_BASE_URL \
    --db-host=mysql \
    --db-name=$MAGENTO_DB_NAME \
    --db-user=$MAGENTO_DB_USER \
    --db-password=$MAGENTO_DB_PASSWORD \
    --admin-user=$MAGENTO_ADMIN_USER \
    --admin-password=$MAGENTO_ADMIN_PASSWORD \
    --admin-firstname=$MAGENTO_ADMIN_FIRSTNAME \
    --admin-lastname=$MAGENTO_ADMIN_LASTNAME \
    --admin-email=$MAGENTO_ADMIN_EMAIL \
    --language=$MAGENTO_LANGUAGE \
    --currency=$MAGENTO_CURRENCY \
    --timezone=$MAGENTO_TIMEZONE \
    --use-rewrites=1 \
    --use-secure=0 \
    --use-secure-admin=0 \
    --backend-frontname=$MAGENTO_BACKEND_FRONTNAME

# php bin/magento module:disable Magento_TwoFactorAuth Magento_AdminAdobeImsTwoFactorAuth
# php bin/magento module:disable Magento_AwsS3
# php bin/magento sampledata:deploy
# php bin/magento setup:upgrade
php bin/magento setup:di:compile
# php bin/magento setup:static-content:deploy
# php bin/magento cache:flush