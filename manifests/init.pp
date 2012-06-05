class radvd (
  $ensure = 'present'
) {
  include radvd::params
  include concat::setup

  $package_ensure = $ensure ? {
    present => 'present',
    absent  => 'absent',
  }

  $service_ensure = $ensure ? {
    present => 'running',
    absent  => 'stopped'
  }

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
