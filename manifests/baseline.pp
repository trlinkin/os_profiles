class os_profile::baseline (
  Array   $timeservers = ['0.pool.ntp.org','1.pool.ntp.org'],
  String  $root_pw     =  '$1$NsVcFaNv$JtdCe90uSW1YE6mhTWwoH0', #puppetlabs4ever
){

  include stdlib::stages

  user { 'root':
    password => $root_pw,
    stage    => 'setup_infra',
  }

  # Global
  class {'ntp':
    servers => $timeservers,
  }

  require os_profile::baseline::motd
  require os_profile::baseline::ssh
  require os_profile::baseline::vim
  require os_profile::baseline::packages
  require os_profile::baseline::firewall
  require os_profile::baseline::firewall_pre
  require os_profile::baseline::firewall_post

}
