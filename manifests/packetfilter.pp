#
# == Class webserver::packetfilter
#
# Configures packetfiltering rules for webservers
#
class webserver::packetfilter
(
    $allow_address_ipv4,
    $allow_address_ipv6

) inherits webserver::params
{
    webserver::packetfilter::allow_ip { $allow_address_ipv4: provider => 'iptables'  }
    webserver::packetfilter::allow_ip { $allow_address_ipv6: provider => 'ip6tables' }
}
