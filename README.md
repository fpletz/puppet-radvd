# Simple radvd module for Puppet

This is a simple module for installing and configuring a radvd
daemon to announce IPv6 prefixes on an interface. It should work on any
Unix-like operating system that is supported by both radvd and puppet.

## Current Status

As of now, all definitions and options that are available in radvd's
config file should be supported. Please file a bug if you encounter
problems.

## Simple Example

```puppet
    class {'radvd':
      interfaces => {
        'eth0' => {
          options  => {
            'AdvSendAdvert' => 'on',
          },
          prefixes => {
            '2001:0DB8:2342:cafe::/64' => {},
          },
        },
      },
    }
```

Or

```puppet
    include 'radvd'
    radvd::interface { 'eth0':
      options  => {
        'AdvSendAdvert' => 'on',
      },
      prefixes => {
        '2001:0DB8:2342:cafe::/64' => {},
      },
    }
```

## Advanced Example

```puppet
    radvd::interface { 'eth1':
      options => {
        'AdvSendAdvert'     => 'on',
        'MinRtrAdvInterval' => 10,
        'MaxRtrAdvInterval' => 30,
      },
      prefixes => {
        '2001:0DB8:2342:cafe::/64' => {
          'AdvOnLink'     => 'on',
          'AdvAutonomous' => 'on',
        },
      },
      rasourceaddresses => [
        'FE80::cafe:1',
      ],
      rdnss => {
        '2001:0DB8:2342:cafe::1' => {
          'AdvRDNSSLifetime' => 30,
        },
      },
      dnssl => {
        'branch.example.com example.com' => {
          'AdvDNSSLLifetime' => 30,
        },
      },
      routes => {
        '2001:0DB8:2342:ccc::/64' => {},
      },
      clients => [
        'fe80::21f:16ff:fe06:3aab',
        'fe80::21d:72ff:fe96:aaff',
      ],
    }
```

## TODO

 * Code Documentation
 * Spec Tests

## Contributions welcome!

Please contribute your code as pull requests if you add or fix code.
I will try to merge or comment as soon as possible. Thanks! :)

