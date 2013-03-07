# Module:: git
# Manifest:: repo/clone.pp
#

# Define:: git::repo::clone
# Args:: $path, $dir = '', $url, $user= 'roo'
#
define git::repo::clone ($cwd, $dir = '', $url, $user= 'root') {

  exec {
    "git clone ${url} ${dir}":
      cwd     => $cwd,
      path    => '/usr/bin:/usr/sbin:/bin',
      creates => "${cwd}/${dir}",
      user    => $user,
      require => Package['git-core'];
  }

} # Define: git::repo::clone
