class tomcat {
  include repos::jpackage

  package { "tomcat6":
    ensure  =>  "present",
    require => File['jpackage50']
  }

  service {"tomcat6":
      enable  => true,
      ensure  => "running",
      hasrestart=> true,
      require => Package["tomcat6"],
  }
}
