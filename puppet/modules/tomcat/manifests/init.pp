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

  file { "/etc/tomcat6/tomcat-users.xml":
    source => "puppet://puppet/modules/tomcat/tomcat-users.xml",
    require => Package["tomcat6-admin-webapps"],
  }

  service {"tomcat6":
      enable  => true,
      ensure  => "running",
      hasrestart=> true,
      require => Package["/etc/tomcat6/tomcat-users.xml"]
  }
}
