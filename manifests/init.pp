#
# == Class: webserver
#
# This class handles the webserver configuration not tied to any particular
# webserver instance. In practice this means configuring packet filtering rules
# It is usually included by the more specific classes such as 'nginx' or
# 'apache2'.
#
# == Parameters
#
# [*manage*]
#  Whether to manage generic webserver configuration with Puppet or not. Valid 
#  values are 'yes' (default) and 'no'.
# [*documentroot*]
#   The webserver's document root directory. Defaults to '/var/www'.
# [*allow_address_ipv4*]
#   IPv4 address/network from which to allow connections. Defaults to 'any' 
#   which means that access is allowed from any IPv4 address.
# [*allow_address_ipv6*]
#   IPv6 address/network from which to allow connections. Defaults to 'any' 
#   which means that access is allowed from any IPv6 address.
#
# == Examples
#
#   include webserver
# 
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class webserver
(
    $manage = 'yes',
    $documentroot = '/var/www',
    $allow_address_ipv4 = 'any',
    $allow_address_ipv6 = 'any'
)
{

if $manage == 'yes' {

    class { '::webserver::config':
        documentroot => $documentroot,
    }

    if tagged('packetfilter') {
        class { '::webserver::packetfilter':
            allow_address_ipv4 => $allow_address_ipv4,
            allow_address_ipv6 => $allow_address_ipv6,
        }
    }
}
}
