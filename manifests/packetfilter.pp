#
# == Class webserver::packetfilter
#
# Configures packetfiltering rules for webservers
#
class webserver::packetfilter(
    $allow_address_ipv4,
    $allow_address_ipv6
)
{


    # IPv4 rules
    firewall { "003 ipv4 accept http from ${allow_address_ipv4}":
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        # Set the allowable source address, unless 'any', in which case the 
        # 'source' parameter is left undefined.
        source => $allow_address_ipv4 ? {
            'any' => undef,
            default => $allow_address_ipv4,
        },
        dport => 80,
        action => 'accept',
    }

    firewall { "004 ipv4 accept https from ${allow_address_ipv4}":
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv4 ? {
            'any' => undef,
            default => $allow_address_ipv4,
        },
        dport => 443,
        action => 'accept',
    }

    # IPv6 rules
    firewall { "003 ipv6 accept http from from ${allow_address_ipv6}":
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv6 ? {
            'any' => undef,
            default => $allow_address_ipv6,
        },
        dport => 80,
        action => 'accept',
    }

    firewall { "004 ipv6 accept https from ${allow_address_ipv6}":
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv6 ? {
            'any' => undef,
            default => $allow_address_ipv6,
        },
        dport => 443,
        action => 'accept',
    }
}
