class nfs::client::debian (
  $nfs_v4 = false,
  $nfs_v4_idmap_domain = undef
) {

  include ::nfs::client::debian::install
  include ::nfs::client::debian::configure
  include ::nfs::client::debian::service

  Class['::nfs::client::debian::install']
  -> Class['::nfs::client::debian::configure']
  -> Class['::nfs::client::debian::service']

}
