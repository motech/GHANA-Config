class maven {
  include java::open_jdk
  include repos::jpackage

  package { "maven":
    ensure  =>  "present",
    require   => [Package["java-1.6.0-openjdk"], File['jpackage50']]
  }
}
