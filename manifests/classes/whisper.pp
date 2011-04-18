class graphite::whisper {

  include graphite::params
  
  exec { "download-whisper":
    command => "wget -O $graphite::params::whisper_dl_loc $graphite::params::whisper_dl_url",
    creates => "$graphite::params::whisper_dl_loc",
    require => File["$graphite::params::build_dir"],
  }

  exec { "unpack-whisper":
    # true is needed to work around a problem with execs and built ins. https://projects.puppetlabs.com/issues/4884
    command => "true ; cd $graphite::params::build_dir ; tar -zxvf $graphite::params::whisper_dl_loc ; cd whisper-0.9.8 ;",
    subscribe => Exec["download-whisper"],
    refreshonly => true
  }

  exec { "install-whisper":
    # true is needed to work around a problem with execs and built ins. https://projects.puppetlabs.com/issues/4884
    command => "true && cd $graphite::params::build_dir/whisper-0.9.8 && python setup.py install",
    require => Exec["unpack-whisper"],
  }

}

