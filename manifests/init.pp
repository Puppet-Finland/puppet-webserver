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
#   IPv4 addresses/networks from which to allow connections. This parameter can 
#   be either a string or an array. Defaults to 'anyv4' which means that access is 
#   allowed from any IPv4 address.
# [*allow_address_ipv6*]
#   As above but for IPv6 addresses. Defaults to 'anyv6', thus allowing access 
#   from any IPv6 address.
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
    $allow_address_ipv4 = 'anyv4',
    $allow_address_ipv6 = 'anyv6'
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
