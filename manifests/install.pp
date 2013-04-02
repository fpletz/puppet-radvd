class radvd::install {
  package{'radvd':
    ensure => $radvd::version,
  }
}
