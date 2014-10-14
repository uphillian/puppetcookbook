define admin_user ($key, $keytype, $dotfiles = 'false') { 
  $username = $name
  user { $username:
    ensure     => present,
  }
  file { "/home/${username}/.ssh":
    ensure  => directory,
    mode    => '0700',
    owner   => $username,
    group   => $username,
    require => File["/home/${username}"],
  }
  ssh_authorized_key { "${username}_key":
    key     => $key,
    type    => "$keytype",
    user    => $username,
    require => File["/home/${username}/.ssh"],
  }
  # dotfiles
  if $dotfiles == 'false' {
    # just create the directory
    file { "/home/${username}":
      ensure  => 'directory',
      mode    => '0700',
      owner   => $username,
      group   => $username,
      require => User["$username"]
    }
  } else {
    # copy in all the files in the subdirectory
    file { "/home/${username}":
      recurse => true,
      mode    => '0700',
      owner   => $username,
      group   => $username,
      source  => "puppet:///modules/admin_user/${username}",
      require => User["$username"]
    }
  }
}
