class activemq {
  include repos::nbnco
  include ruby::rubygem_stomp
  include java::open_jdk

  package { "tanukiwrapper":
    ensure  =>  "present",
    require   => Yumrepo[puppetlabs]
  }

  package { "activemq":
    ensure    => "present",
    require   => [Yumrepo[puppetlabs], Package["tanukiwrapper"]]
  }

  service { "activemq":
    enable => true,
    ensure => running,
    require => [Package["activemq"]
  }
}
