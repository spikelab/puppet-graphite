node /^[a-z,0-9].*/ {
  
  Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin" }
  
  include graphite::buildenv
  include graphite::whisper
  include graphite::web

}
