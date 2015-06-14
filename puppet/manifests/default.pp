# Set up the paths
Exec {path => '/usr/bin:/usr/sbin/:/bin:/sbin' }
exec { 'apt-get-update':
  command => '/usr/bin/apt-get update',
}
# Ensure update runs before installing pacakges
Exec['apt-get-update'] -> Package <| |>

package { "gnome-shell":
  ensure => present,
}

package { ["git", "curl", "vim", "vim-nox", "tmux", "gnome-terminal", "vim-gnome",]:
  ensure => present,
}

