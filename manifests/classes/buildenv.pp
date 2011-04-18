class graphite::buildenv {

  include graphite::params

  file { "${graphite::params::build_dir}":
    ensure => directory,
    recurse => true,
    purge => true,
    backup => false,
  }
  
  file { "${graphite::params::build_dir}/patches":
    ensure => directory,
    recurse => true,
    purge => true,
    source => "puppet:///modules/graphite/patches",
    require => File["${graphite::params::build_dir}"]
  }

}
