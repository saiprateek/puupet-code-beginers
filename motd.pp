file {'/etc/mod':
ensure => 'file',
content => 'Welcome to serve',
path => '/etc/motd'
}
