class os_profile::baseline (
  Array   $timeservers = ['0.pool.ntp.org','1.pool.ntp.org'],
  String  $root_pw     =  '$1$NsVcFaNv$JtdCe90uSW1YE6mhTWwoH0', #puppetlabs4ever
){

  include stdlib::stages

  # Global
  class {'ntp':
    servers => $timeservers,
  }

  class {'::os_profile::baseline::rootpw':
    root_pw => $root_pw,
    stage   => 'setup',
  }

  require os_profile::baseline::motd
  require os_profile::baseline::ssh
  require os_profile::baseline::vim
  require os_profile::baseline::packages
  require os_profile::baseline::firewall
  require os_profile::baseline::firewall_pre
  require os_profile::baseline::firewall_post

}