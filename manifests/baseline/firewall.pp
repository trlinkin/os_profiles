class os_profile::baseline::firewall (
  $purge = false,
) {

  Firewall {
    before  => Class['::os_profile::baseline::firewall_post'],
    require => Class['::os_profile::baseline::firewall_pre'],
  }

  class { ['::os_profile::baseline::firewall_pre', '::os_profile::baseline::firewall_post']: }

  resources { 'firewall':
    purge => $purge,
  }

  include ::firewall

}
