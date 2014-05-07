class rootuser {
  $rootpassword = hiera('rootpassword')
  notify { $rootpassword: }
  $oshash = hashpasswd($rootpassword)

  user { 'root':
    ensure   => 'present',
    uid      => 0,
    gid      => 0,
    comment  => hiera('rootcomment'),
    password => $oshash,
  }
}
