class tomcat {
  include repos::jpackage

  package { "tomcat6":
    ensure  =>  "present",
    require => File['jpackage50']
  }

  package { 'tomcat6-admin-webapps':
    ensure => installed,
    require => Package['tomcat6']
  }

  service {"tomcat6":
      enable  => true,
      ensure  => "running",
      hasrestart=> true,
      require => Package["tomcat6"],
  }
}
