# Module:: git
# Manifest:: init.pp
#

# Class:: git
#
#
class git {

  package {
    'git-core':
      ensure  => installed;
  }

} # Class:: git
