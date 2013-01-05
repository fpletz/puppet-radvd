class radvd (
  $ensure = 'present'
) {
  include radvd::params
  include radvd::config

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
    ensure  => $service_ensure,
    require => Package['radvd'],
  }
}
