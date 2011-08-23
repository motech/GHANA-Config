class mcollective {
  include ruby::rubygem_stomp
  include repos::puppetlabs

  package { "mcollective-common":
    provider => "yum",
    ensure => "present",
    require => [Yumrepo[puppetlabs], Package[rubygem-stomp]]
  }
}
