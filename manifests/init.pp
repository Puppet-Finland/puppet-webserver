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
# include webserver
# 
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license
# See file LICENSE
#
class webserver(
    $documentroot = '/var/www',
    $allow_address_ipv4 = 'any',
    $allow_address_ipv6 = 'any'
)
{

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_webserver', 'true') != 'false' {

    class { 'webserver::config':
        documentroot => $documentroot,
    }

    if tagged('packetfilter') {
        class { 'webserver::packetfilter':
            allow_address_ipv4 => "$allow_address_ipv4",
            allow_address_ipv6 => "$allow_address_ipv6",
        }
    }
}
}
