node default {
  include radvd

  radvd::interface { 'eth0':
    options  => {
      'AdvSendAdvert'     => 'on',
      'MinRtrAdvInterval' => 10,
      'MaxRtrAdvInterval' => 30,
    },
    prefixes => {
      '2001:0DB8:2342:babe::/64' => {
        'AdvOnLink'     => 'on',
        'AdvAutonomous' => 'on',
      },
    },
  }
}
