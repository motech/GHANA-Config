class jenkins {
  package { "jenkins":
    ensure  =>  "present",
    require   => Yumrepo[jenkins]
  }
}
