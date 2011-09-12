class repos::jpackage {
  file { "/usr/local/src/jpackage-utils-compat-el5-0.0.1-1.noarch.rpm":
    source => "puppet://puppet/modules/repos/jpackage-utils-compat-el5-0.0.1-1.noarch.rpm"
  }

  package { "jpackage-utils":
    provider => "rpm",
    ensure => "present",
    source => "/usr/local/src/jpackage-utils-compat-el5-0.0.1-1.noarch.rpm",
    require => File["/usr/local/src/jpackage-utils-compat-el5-0.0.1-1.noarch.rpm"]
  }

  file { "jpackage50":
    name => "/etc/yum.repos.d/jpackage50.repo",
    ensure => present,
    source => "puppet://puppet/modules/repos/jpackage50.repo",
    require => Package["jpackage-utils"]
  }

  exec { 'yum-clean-expire-cache':
    command => '/usr/bin/yum clean expire-cache',
    require => File["jpackage50"]
  }
}
