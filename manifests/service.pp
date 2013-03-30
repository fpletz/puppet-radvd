class radvd::service {
  $ensure = $radvd::start ? {true => running, default => stopped}

  service{'radvd':
    ensure => $ensure,
    enable => $radvd::enable,
  }
}
