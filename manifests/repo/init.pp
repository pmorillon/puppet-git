# Module:: git
# Manifest:: repo/init.pp
#

# Define:: git::repo::init
#
#
define git::repo::init ($user = 'root', $bare = false) {

  $cmd_opts = $bare ? {
    true    => '--bare',
    default => ''
  }

  exec {
    "git_init_in_$name":
    command => "git ${cmd_opts} init",
    cwd     => $name,
    creates => $bare ? {
      true    => "${name}/HEAD",
      default => "${name}/.git"
    },
    path    => '/usr/bin:/usr/sbin:/bin',
    user    => $user,
    require => Package['git-core'];
  }

} # Define: git::repo::init

