define radvd::interface (
  $options={},
  $prefixes={},
  $rdnss={},
  $dnssl={},
) {
  concat::fragment { "radvd.conf-interface-${name}":
    target  => $radvd::params::conffile,
    content => template('radvd/radvd.conf-interface.erb'),
  }
}
