#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=http://www.ioplex.com/d/plexcel-2.7.32.x86_64.tar.gz

status "Setting up Plexecl..."

notice "Downloading Plexecl"
curl_retry_on_18 $dep_url -O

notice "Unpacking Plexcel"
tar -xzf plexcel-2.7.32.x86_64.tar.gz

notice "Copying libs for Plexcel"
cp plexcel-2.7.32.x86_64/x86_64/linux/* "$build_dir/.heroku/php"

notice "Import extension phalcon into php.ini"
echo "extension=/app/user/lib/plexcel.so.php-${php-version}.so" >> /app/.heroku/php/etc/php/php.ini