# Easy radvd module for Puppet

This is a quick and dirty module for installing and configuring a radvd
daemon to announce IPv6 prefixes on an interface. It should work on any
Unix-like operating system that radvd and puppet support.

## Example

    include radvd
    radvd::interface { 'eth0':
      options => {
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
      rdnss => {
        '2001:0DB8:2342:babe::1' => {
          'AdvRDNSSLifetime' => 30,
        },
      },
      dnssl => {
        'branch.example.com example.com' => {
          'AdvRDNSSLifetime' => 30,
        },
      },
    }

## Contributions welcome!

Please contribute your code as pull requests if you add or fix code.
I will try to merge or comment as soon as possible. Thanks! :)

