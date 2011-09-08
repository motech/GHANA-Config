class repos::jpackage {
  file { "jpackage50":
    name => "/etc/yum.repos.d/jpackage50.repo",
    ensure => present,
    source => "puppet://puppet/modules/repos/jpackage50.repo"
  }
}
