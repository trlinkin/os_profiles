class profile::platform::baseline (
  Array   $timeservers = ['0.pool.ntp.org','1.pool.ntp.org'],
  String  $root_pw     =  '$1$NsVcFaNv$JtdCe90uSW1YE6mhTWwoH0', #puppetlabs4ever
){

  user { 'root':
    password => $root_pw,
  }

  # Global
  class {'ntp':
    servers => $timeservers,
  }

  require os_profile::baseline::motd
  require os_profile::baseline::ssh
  require os_profile::baseline::vim
  require os_profile::baseline::packages
  require os_profile::baseline::firewall_pre
  require os_profile::baseline::firewall_post
  require os_profile::baseline::firewall


}
