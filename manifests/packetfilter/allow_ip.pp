#
# == Define: webserver::packetfilter::allow_ip
#
# Allow traffic from an IPv4 or IPv6 address to the webserver ports
#
define webserver::packetfilter::allow_ip
(
    $provider = 'iptables'
)
{

    include ::webserver::params

    $allow_address = $title

    $source = $allow_address ? {
        /(any|anyv4|anyv6)/ => undef,
        default         => $allow_address,
    }

    @firewall { "003 accept http from ${allow_address}":
        provider => $provider,
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source,
        dport    => 80,
        action   => 'accept',
        tag      => 'default',
    }

    @firewall { "004 accept https from ${allow_address}":
        provider => $provider,
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source,
        dport    => 443,
        action   => 'accept',
        tag      => 'default',
    }
}
