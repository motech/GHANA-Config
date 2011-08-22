class activemq {
  include repos::puppetlabs
  include ruby::rubygem_stomp
  include java::open_jdk

  package { "tanukiwrapper":
    ensure  =>  "present",
    require => Package[puppetlabs-repo]
  }

  package { "activemq":
    ensure    => "present",
    require   => [Package[puppetlabs-repo], Package["tanukiwrapper"]]
  }

  service { "activemq":
    enable => true,
    ensure => running,
    require => Package["activemq"]
  }
}
