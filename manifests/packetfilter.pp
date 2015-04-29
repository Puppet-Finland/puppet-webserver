#
# == Class webserver::packetfilter
#
# Configures packetfiltering rules for webservers
#
class webserver::packetfilter
(
    $allow_address_ipv4,
    $allow_address_ipv6
)
{

    $source_v4 = $allow_address_ipv4 ? {
        'any' => undef,
        default => $allow_address_ipv4,
    }

    $source_v6 = $allow_address_ipv6 ? {
        'any' => undef,
        default => $allow_address_ipv6,
    }

    # IPv4 rules
    firewall { '003 ipv4 accept http':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        # Set the allowable source address, unless 'any', in which case the 
        # 'source' parameter is left undefined.
        source   => $source_v4,
        dport    => 80,
        action   => 'accept',
    }

    firewall { '004 ipv4 accept https':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => 443,
        action   => 'accept',
    }

    # IPv6 rules
    firewall { '003 ipv6 accept http':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v6,
        dport    => 80,
        action   => 'accept',
    }

    firewall { '004 ipv6 accept https':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v6,
        dport    => 443,
        action   => 'accept',
    }
}
