class mcollective {
  include ruby::rubygem_stomp
  include repos::puppetlabs

  package { "mcollective-common":
    provider => "yum",
    ensure => "present",
    require => [Package[puppetlabs-repo], Package[rubygem-stomp]]
  }

  package { "mcollective":
    provider => "yum",
    ensure   => "present",
    require  => [Package[puppetlabs-repo], Package["mcollective-common"]]
  }

  file { "/etc/mcollective/server.cfg":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 640,
    require => Package["mcollective"]
  }

  service { "mcollective":
    hasstatus  => true,
    hasrestart => true,
    ensure     => true,
    require    => [Package["mcollective"], File["/etc/mcollective/server.cfg"]],
  }
}
