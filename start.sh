#!/bin/bash
if [ ! -f /var/www/sites/default/settings.php ]; then
	sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/sites-available/default
	a2enmod rewrite vhost_alias
	cd /var/www/
	drush site-install $DRUPAL_PROFILE -y --account-name=admin --account-pass=admin --db-url="mysqli://root:${DB_ENV_MYSQL_ROOT_PASSWORD}@${DB_PORT_3306_TCP_ADDR}:${DB_PORT_3306_TCP_PORT}/drupal"
fi
supervisord -n
