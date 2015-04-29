#
# == Class: webserver::params
#
# Set up operating system -specific parameters
#
class webserver::params {

    case $::osfamily {
        'RedHat': { }
        'Debian': { }
        default: { fail("Unsupported OS: ${::osfamily}") }
    }
}
