class java::open_jdk {
  package { "java-1.6.0-openjdk":
    ensure  =>  "absent"
  }

  $sun_java_bin_version = $sun_java_jre_version
  $sun_java_jdk_version = $sun_java_jre_version

  package {
    "sun-java6-jre":
      ensure => $sun_java_jre_version ? {
        "" => installed,
        default => $sun_java_jre_version
      };
    "sun-java6-bin":
      ensure => $sun_java_bin_version ? {
        "" => installed,
        default => $sun_java_bin_version
      },
      require => Package["sun-java6-jre"];
    "sun-java6-jdk":
      ensure => $sun_java_jdk_version ? {
        "" => installed,
        default => $sun_java_jdk_version
      },
      require => Package["sun-java6-bin"];
  }

  # Ensure we have sun-java set as the default alternative
  exec {
    "update-java-alternatives --jre --set java-6-sun":
      path => ["/usr/sbin", "/usr/bin"],
      unless => 'test $(readlink /etc/alternatives/java) == "/usr/lib/jvm/java-6-sun/jre/bin/java"',
      require => Package["sun-java6-bin"];
  }
}
