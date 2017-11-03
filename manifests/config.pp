class radvd::config {
  concat {$radvd::conffile:
    owner        => 'root',
    group        => 'root',
    mode         => '0644',
    validate_cmd => '/usr/sbin/radvd --configtest --config %',
  }
  concat::fragment { '01-puppet-header':
    target  => $radvd::conffile,
    content => "# This file is managed by Puppet. DO NOT EDIT.\n",
    order   => '01',
  }
  create_resources(radvd::interface, $radvd::interfaces)
}
