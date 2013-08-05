#
# == Class webserver::config
#
# Webserver configuration not tied to any particular webserver types.
#
class webserver::config($documentroot) {

    # nginx does not create the document root directory by default, but Apache2 
    # does. Whatever the case we probably want it, and other modules such as 
    # 'softwarerepo', 'createrepo' and 'reprepro' depend on it existing.
    file { 'webserver-www':
        name => "${documentroot}",
        ensure => directory,
    }
}
