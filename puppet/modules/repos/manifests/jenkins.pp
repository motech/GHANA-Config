class repos::jenkins {
  yumrepo { jenkins:
    descr    => 'Repo for jenkin',
    baseurl  => 'http://pkg.jenkins-ci.org/redhat/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
  }
}
