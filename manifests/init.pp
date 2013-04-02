class radvd (
  $version = 'present',
  $interfaces = {},
  $enable = true,
  $start = true,
  $conffile = '/etc/radvd.conf',
) {
  class{'radvd::install': }
  class{'radvd::config': }
  class{'radvd::service': }

  Class['radvd::install'] ->
  Class['radvd::config'] ~>
  Class['radvd::service']

  Class['radvd::install'] ->
  Radvd::Interface <| |> ~>
  Class['radvd::service']

  Class['radvd::service'] ->
  Class['radvd']

}
