#
# == Class webserver::packetfilter
#
# Configures packetfiltering rules for webservers
#
class webserver::packetfilter {

    # IPv4 rules
    firewall { '003 ipv4 accept http':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        port => 80,
        action => 'accept',
    }

    firewall { '004 ipv4 accept https':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        port => 443,
        action => 'accept',
    }

    # IPv6 rules
    firewall { '003 ipv6 accept http':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        port => 80,
        action => 'accept',
    }

    firewall { '004 ipv6 accept https':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        port => 443,
        action => 'accept',
    }
}
