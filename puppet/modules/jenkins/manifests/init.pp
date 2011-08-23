class jenkins {
  include repos::jenkins

  package { "jenkins":
    ensure  =>  "present",
    require   => Yumrepo[jenkins]
  }
}
