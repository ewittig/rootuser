class rootuser {
  $rootpassword = hiera('rootpassword')
  $oshash = hashpasswd($rootpassword,$::osfamily)

  user { 'root':
    ensure   => 'present',
    uid      => 0,
    gid      => 0,
    comment  => hiera('rootcomment'),
    password => $oshash,
  }
}
