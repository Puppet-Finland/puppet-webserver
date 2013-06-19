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
# None at the moment
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
    $allow_address_ipv4 = 'any',
    $allow_address_ipv6 = 'any'
)
{

    include webserver::config

    if tagged('packetfilter') {
        class { 'webserver::packetfilter':
            allow_address_ipv4 => "$allow_address_ipv4",
            allow_address_ipv6 => "$allow_address_ipv6",
        }
    }
}
