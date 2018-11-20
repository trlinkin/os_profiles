class os_profiles::baseline::tuning (
  Boolean $enable_ipv6 = false,
  Enum['disabled','enabled','permissive'] $selinux_mode = 'permissive',
){
  $ipv6_val = $enable_ipv6 ? {
    true  => '1',
    false => '0',
  }

  sysctl{ 'net.ipv6.conf.default.disable_ipv6':
    enaure => present
    value  => $ipv6_val,
  }

  sysctl{ 'net.ipv6.conf.all.disable_ipv6':
    enaure => present
    value  => $ipv6_val,
  }

  sysctl { 'fs.file-max':
    ensure => present,
    value  => '10000',
  }

  sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
    ensure => present,
    value  => '1',
  }

  sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
    ensure => present,
    value  => '1',
  }

  $selinunx_config = @("SELINUX"/L)
    SELINUX=${selinux_mode}
    SELINUXTYPE=targeted
  | SELINUX

  file {'/etc/selinux/config':
    ensure  => file,
    content => $selinunx_config,
  }
}
