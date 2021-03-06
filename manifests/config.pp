# The class that takes care to
# configure the service
class apache13::config (
  $templatestorage,
  $template,
) {

  file { '/etc/apache':
    ensure => 'directory',
    owner  => 'root',
    group  => 'www',
    mode   => '0750',
  }

  file { '/etc/apache/sub.class1.server.ca.pem':
    ensure  => 'present',
    owner   => 'root',
    group   => 'www',
    mode    => '0640',
    content => lookup('sub.class1.server.ca.pem'),
  }
  file { '/etc/apache/www.my-domain.de.pem':
    ensure  => 'present',
    owner   => 'root',
    group   => 'www',
    mode    => '0640',
    content => lookup('www.my-domain.de.pem'),
  }
  file { '/etc/apache/www.my-domain.de.key':
    ensure  => 'present',
    owner   => 'root',
    group   => 'www',
    mode    => '0640',
    content => lookup('www.my-domain.de.key'),
  }
  file { '/var/www/conf/modules':
    ensure => 'directory',
    owner  => 'root',
    group  => 'www',
    mode   => '0750',
  }

  case $templatestorage {
    'puppet': {
                file { '/var/www/conf/httpd.conf':
                  owner   => 'root',
                  group   => 'www',
                  mode    => '0640',
                  content => template("apache13/${template}"),
                }
              }
    'hiera': {
                file { '/var/www/conf/httpd.conf':
                  owner   => 'root',
                  group   => 'www',
                  mode    => '0640',
                  content => lookup($template),
                }
              }
    default: { fail("templatestorage must be either 'puppet' or 'hiera'") }
  }

}
