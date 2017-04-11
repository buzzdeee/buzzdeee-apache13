# The class that takes care
# of the installation
class apache13::install (
  $package_ensure,
  $package_name,
) {
  package { $package_name:
    ensure => $package_ensure,
  }
}
