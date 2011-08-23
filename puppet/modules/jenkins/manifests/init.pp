class jenkins {
  include repos::jenkins
  include java::open_jdk

  package { "jenkins":
    ensure  =>  "present",
    require   => Yumrepo[jenkins], Package["java-1.6.0-openjdk"]
  }

  service {"jenkins":
      enable  => true,
      ensure  => "running",
      hasrestart=> true,
      require => Package["jenkins"],
  }
}
