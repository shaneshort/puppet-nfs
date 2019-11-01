class nfs::client::ubuntu::service {

  case $::lsbdistcodename {
    'xenial', 'bionic', 'eoan': { $rpc_service = 'rpcbind.socket' }
    default: { $rpc_service = 'rpcbind' }
  }

  service { $rpc_service:
    ensure    => running,
    enable    => true,
    hasstatus => false,
  }

  if $nfs::client::ubuntu::nfs_v4 {
    if versioncmp($::lsbdistrelease, '16.04') < 0 {
      service { 'idmapd':
        ensure    => running,
        enable    => true,
        subscribe => Augeas['/etc/idmapd.conf', '/etc/default/nfs-common'],
      }
    }
  } else {
    service { 'idmapd':
      ensure => stopped,
      enable => false,
    }
  }
}
