class apache13::params {
  $package_ensure  = 'installed'
  $package_name    = 'apache-httpd-openbsd'
  $service_ensure  = 'running'
  $service_enable  = true
  $service_flags   = ''
  $service_name    = 'apache'
  $templatestorage = 'hiera'
  $template        = 'httpd.conf.erb'
}
