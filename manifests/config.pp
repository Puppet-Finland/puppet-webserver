#
# == Class webserver::config
#
# Webserver configuration not tied to any particular webserver types.
#
class webserver::config {

    # nginx does not create /var/www directory by default, but Apache2 does. 
    # Whatever the case we probably want it.
    file { 'webserver-www':
        name => '/var/www',
        ensure => directory,
    }
}
