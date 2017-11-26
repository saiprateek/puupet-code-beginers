package { 'ntp':
ensure => 'installed', #'absent', 'purged', 'latest', '4.1'
#name => 'ntp' # not used here as we make use of title
provider => 'yum', #Nornmaly its not required

}

package { 'httpd':
ensure => 'installed', #'absent', 'purged', 'latest', '4.1'
#ckage { 'httpd':
#ensure => 'installed', #'absent', 'purged', 'latest', '4.1'
##name => 'httpd' # not used here as we make use of title
provider => 'yum', #Nornmaly its not required
}
service{ 'ntpd':
ensure => 'running', #'stopped,
#name => 'ntp''
enable => true, #false
}


$ntp_conf = '#managed by conf
server 192.168.0.3 iburst
driftfile /var/lib/ntp/drift'

file { '/etc/ntp.conf':
ensure => 'file',
content => $ntp_conf,

}


group { 'sudo':
ensure => 'present'}

user { 'bob':
ensure => 'present',
managehome => true,
groups  => ['sudo', 'users'],
password => pw_hash('password1', 'SHA-512', 'salt'),
}



host{
'timeserver': ip => '192.168.0.3',
host_aliases => 'tock',
}




#here doc program ==================
#$ntp_conf = @(END) 
#Managed by puppet - do not edit
#server 192.168.0.3 iburst prefer
#server uk.pool.ntp.org
#driftfile /var/lib/ntp/drift
#END
#
#case $facts['os']['family'] {
#  'RedHat': {
#      $ntp_service = 'ntpd'
#          $admingroup = 'wheel'
#            }
#              'Debian': {
#                  $ntp_service = 'ntp'
#                      $admingroup = 'sudo'
#                        }
#                          default : {
#                              fail("Your ${facts['os']['family']} is not supported")
#                                }
#                                }
#
#                                package { 'ntp':
#                                  before => File['/etc/ntp.conf'],
#                                  }
#
#                                  File {
#                                    owner  => 'root',
#                                      group  => $admingroup,
#                                        mode   => '0664',
#                                          ensure => 'file',
#                                          }
#
#                                          file { '/etc/ntp.conf':
#                                            content => $ntp_conf,
#                                              notify  => Service['NTP_Service'],
#                                              }
#
#                                              service {'NTP_Service':
#                                                ensure    => 'running',
#                                                  enable    => true,
#                                                    name      => $ntp_service,
#                                                      subscribe => File['/etc/ntp.conf'],
#                                                      }

#$ntp_conf = @(END) 
#Managed by puppet - do not edit
#server 192.168.0.3 iburst prefer
#server uk.pool.ntp.org
#driftfile /var/lib/ntp/drift
#END
#
#case $facts['os']['family'] {
#  'RedHat': {
#      $ntp_service = 'ntpd'
#          $admingroup = 'wheel'
#            }
#              'Debian': {
#                  $ntp_service = 'ntp'
#                      $admingroup = 'sudo'
#                        }
#                          default : {
#                              fail("Your ${facts['os']['family']} is not supported")
#                                }
#                                }
#
#                                package { 'ntp':
#                                  before => File['/etc/ntp.conf'],
#                                  }
#
#                                  File {
#                                    owner  => 'root',
#                                      group  => $admingroup,
#                                        mode   => '0664',
#                                          ensure => 'file',
#                                          }
#
#                                          file { '/etc/ntp.conf':
#                                            content => $ntp_conf,
#                                              notify  => Service['NTP_Service'],
#                                              }
#
#                                              service {'NTP_Service':
#                                                ensure    => 'running',
#                                                  enable    => true,
#                                                    name      => $ntp_service,
#                                                      subscribe => File['/etc/ntp.conf'],






#                                                      }
#
#
#
#                                                      #
#
#
