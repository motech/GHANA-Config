class jenkins {
  include repos::jenkins

  package { "jenkins":
    ensure  =>  "present",
    require   => Yumrepo[jenkins]
  }

  service {"jenkins":
      enable  => true,
      ensure  => "running",
      hasrestart=> true,
      require => Package["jenkins"],
  }
}
