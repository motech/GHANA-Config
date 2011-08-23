class activemq {
  include repos::puppetlabs
  include ruby::rubygem_stomp
  include java::open_jdk
  include tanukiwrapper

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
