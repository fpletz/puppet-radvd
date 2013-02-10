node default {
  radvd::interface { 'eth0':
    options  => {
      'AdvSendAdvert' => 'on',
    },
    prefixes => {
      '2001:0DB8:2342:babe::/64' => {},
    },
  }

  radvd::interface { 'eth1':
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
    rdnss    => {
      '2001:0DB8:2342:babe::1' => {
        'AdvRDNSSLifetime' => 30,
      },
    },
    dnssl    => {
      'branch.example.com example.com' => {
        'AdvDNSSLLifetime' => 30,
      },
    },
    routes   => {
      '2001:0DB8:2342:ccc::/64' => {},
    },
    clients  => [
      'fe80::21f:16ff:fe06:3aab',
      'fe80::21d:72ff:fe96:aaff',
    ],
  }
}
