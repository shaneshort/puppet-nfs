class nfs::client::gentoo (
  $nfs_v4 = false,
  $nfs_v4_idmap_domain = undef
) {

  include ::nfs::client::gentoo::install
  include ::nfs::client::gentoo::configure
  include ::nfs::client::gentoo::service

  Class['::nfs::client::gentoo::install']
  -> Class['::nfs::client::gentoo::configure']
  -> Class['::nfs::client::gentoo::service']


}
