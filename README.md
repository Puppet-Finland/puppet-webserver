# webserver

A generic webserver module for Puppet. Can be used to manage IPv4 and IPv6
firewall rules for webservers on Linux either directly, or from other modules
such as
[puppetfinland/apache2](https://github.com/Puppet-Finland/puppet-apache2] or
[puppetfinland/nginx](https://github.com/Puppet-Finland/puppet-nginx].

# Module usage

Allow access to ports 80 and 443 from any IPv4 or IPv6 address:

    include ::webserver

Or more explicitly:

    class { '::webserver':
      allow_address_ipv4 => 'anyv4',
      allow_address_ipv6 => 'anyv6',
    }

Prevent IPv6 access but allow connections via IPv4 from an intranet:

    class { '::webserver':
      allow_address_ipv4 => '10.0.0.0/8',
      allow_address_ipv6 => '::1',
    }

For details see [init.pp](manifests/init.pp).

