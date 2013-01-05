define radvd::interface (
  $options={},
  $prefixes={},
  $rdnss={},
  $dnssl={},
  $routes={},
  $clients=[],
) {
  include radvd::params
  include radvd::config

  concat::fragment { "radvd.conf-interface-${name}":
    target  => $radvd::params::conffile,
    content => template('radvd/radvd.conf-interface.erb'),
  }
}
