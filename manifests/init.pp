# == Class: apache13
#
# Full description of class apache13 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'apache13':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class apache13 (
  $package_ensure  = $apache13::params::package_ensure,
  $package_name    = $apache13::params::package_name,
  $service_ensure  = $apache13::params::service_ensure,
  $service_enable  = $apache13::params::service_enable,
  $service_name    = $apache13::params::service_name,
  $service_flags   = $apache13::params::service_flags,
  $templatestorage = $apache13::params::templatestorage,
  $template        = $apache13::params::template,
) inherits apache13::params {

  class { 'apache13::install':
    package_ensure => $package_ensure,
    package_name   => $package_name,
  }

  class { 'apache13::config':
    templatestorage => $templatestorage,
    template        => $template,
  }

  class { 'apache13::service':
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    service_name   => $service_name,
    service_flags  => $service_flags,
  }

  Class['apache13::install']
  -> Class['apache13::config']
  ~> Class['apache13::service']
}
