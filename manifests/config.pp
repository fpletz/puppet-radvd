class radvd::config {
  include radvd::params
  include concat::setup
  include radvd

  concat { $radvd::params::conffile:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['radvd'],
    notify  => Service['radvd'],
  }
}
