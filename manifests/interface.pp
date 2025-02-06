define radvd::interface (
  $options={},
  $prefixes={},
  $rasourceaddresses=[],
  $rdnss={},
  $dnssl={},
  $routes={},
  $clients=[],
) {
  concat::fragment { "radvd.conf-interface-${name}":
    target  => $radvd::conffile,
    content => template('radvd/radvd.conf-interface.erb'),
  }
}
