class os_profile::baseline::rootpw(
  $string $root_pw,
){

  user { 'root':
    password  => $root_pw,
  }
}
