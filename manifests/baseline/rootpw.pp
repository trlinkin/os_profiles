class os_profile::baseline::rootpw(
  String $root_pw,
){

  user { 'root':
    password  => $root_pw,
  }
}
