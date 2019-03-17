class nfs::client::ubuntu (
  $nfs_v4 = false,
  $nfs_v4_idmap_domain = undef
) {

  include ::nfs::client::ubuntu::install
  include ::nfs::client::ubuntu::configure
  include ::nfs::client::ubuntu::service

  Class['::nfs::client::ubuntu::install']
  -> Class['::nfs::client::ubuntu::configure']
  -> Class['::nfs::client::ubuntu::service']

}
