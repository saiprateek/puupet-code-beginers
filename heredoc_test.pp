case $facts['os']['family'] {
  'RedHat': {
    package { 'httpd':
  	ensure => installed,
        provider => 'yum',
    }

   file { '/var/www/html/index.html':
    ensure  => 'present',
    replace => 'no', # this is the important property
    content => "From Puppet\n",
    mode    => '0644',
  }

  notify  => Service['NTP_Service'],

  }
  'Debian': {
    $ntp_service = 'ntp'
    $admingroup = 'sudo'
  }
  default : {
    fail("Your ${facts['os']['family']} is not supported")
  }
}


file { '/var/www/html/index.html':
  content => $ntp_conf,
  notify  => Service['NTP_Service'],
}

service {'NTP_Service':
  ensure    => 'running',
  enable    => true,
  name      => 'nttp service',
  subscribe => File['/var/www/html/index.html'],
}
