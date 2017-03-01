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
#  Manage generic webserver configuration with Puppet or not. Valid values are 
#  true (default) and false.
# [*manage_packetfilter*]
#  Manage packet filtering rules. Valid values are true (default) and false.
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
#   include ::webserver
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
    Boolean $manage = true,
    Boolean $manage_packetfilter = true,
            $allow_address_ipv4 = 'anyv4',
            $allow_address_ipv6 = 'anyv6'
)
{

if $manage {

    if $manage_packetfilter {
        class { '::webserver::packetfilter':
            allow_address_ipv4 => $allow_address_ipv4,
            allow_address_ipv6 => $allow_address_ipv6,
        }
    }
}
}
