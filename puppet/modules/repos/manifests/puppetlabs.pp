class repos::puppetlabs {
  yumrepo { puppetlabs:
    descr    => 'Repo for puppet libraries',
    baseurl  => 'http://yum.puppetlabs.com/',
    enabled  => 1,
    gpgcheck => 0,
  }
}
