class radvd::service {
  if $radvd::managesvc {
    $ensure = $radvd::start
  } else {
    $ensure = undef
  }

  service{'radvd':
    ensure => $ensure,
    enable => $radvd::enable,
  }
}
