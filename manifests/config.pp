class radvd::config {
  concat {$radvd::conffile:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  create_resources(radvd::interface, $radvd::interfaces)
}
