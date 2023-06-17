# litelleframework-mvc-skeleton e-lab-reservation

## Introduction
--Version 
This is a application e-lab-reservation based skeleton application using the litelleframwork MVC layer and module
systems. This application is meant to be used as a starting place for those
looking to get their feet wet with litelleframwork MVC.

## Installation using Composer

The easiest way to create a new litelleframwork MVC project is to use
[Composer](https://getcomposer.org/). If you don't have it already installed,
then please install as per the [documentation](https://getcomposer.org/doc/00-intro.md).

To create your new littelframework MVC project:

```bash
$ gh repo clone SmartEduTech/e-lab-reservation <path/to/application>
 
```

Once installed, you can test it out immediately using PHP's built-in web server:

```bash
$ cd path/to/install
$ php -S 0.0.0.0:8080 -t public
# OR use the composer alias:
$ composer run --timeout 0 serve
```

This will start the cli-server on port 8080, and bind it to all network
interfaces. You can then visit the site at http://localhost:8080/
- which will bring up litelleframwork MVC Skeleton welcome page.

**Note:** The built-in CLI server is *for development only*.

## Development mode
 

You may provide development-only modules and bootstrap-level configuration in
`config/development.config.php.dist`, and development-only application
configuration in `config/autoload/development.local.php.dist`. Enabling
development mode will copy these files to versions removing the `.dist` suffix,
while disabling development mode will remove those copies.

Development mode is automatically enabled as part of the skeleton installation process. 
After making changes to one of the above-mentioned `.dist` configuration files you will
either need to disable then enable development mode for the changes to take effect,
or manually make matching updates to the `.dist`-less copies of those files.

## Running Unit Tests
 

Once testing support is present, you can run the tests using:

```bash
$ ./vendor/bin/phpunit
```
   
## Web server setup

### Apache setup

To setup apache, setup a virtual host to point to the public/ directory of the
project and you should be ready to go! It should look something like below:

```apache
<VirtualHost *:80>
    ServerName e-lab-reservation.localhost
    DocumentRoot /path/to/e-lab-reservation/public
    <Directory /path/to/e-lab-reservation/public>
        DirectoryIndex index.php
        AllowOverride All
        Order allow,deny
        Allow from all
        <IfModule mod_authz_core.c>
        Require all granted
        </IfModule>
    </Directory>
</VirtualHost>
```

### Nginx setup

To setup nginx, open your `/path/to/nginx/nginx.conf` and add an
[include directive](http://nginx.org/en/docs/ngx_core_module.html#include) below
into `http` block if it does not already exist:

```nginx
http {
    # ...
    include sites-enabled/*.conf;
}
```


Create a virtual host configuration file for your project under `/path/to/nginx/sites-enabled/e-lab-reservation.localhost.conf`
it should look something like below:

```nginx
server {
    listen       80;
    server_name  e-lab-reservation.localhost;
    root         /path/to/e-lab-reservation/public;

    location / {
        index index.php;
        try_files $uri $uri/ @php;
    }

    location @php {
        # Pass the PHP requests to FastCGI server (php-fpm) on 127.0.0.1:9000
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_param  SCRIPT_FILENAME /path/to/e-lab-reservation/public/index.php;
        include fastcgi_params;
    }
} 
 