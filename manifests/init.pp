class radvd (
  $package_ensure = 'present'
) {
  include radvd::params
  include concat::setup

  package { 'radvd':
    ensure => $package_ensure,
  }

  service { 'radvd':
    ensure => running,
  }

  concat { $radvd::params::conffile:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['radvd'],
    notify  => Service['radvd'],
  }
}
