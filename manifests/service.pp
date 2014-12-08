class apache13::service (
  $service_ensure,
  $service_enable,
  $service_flags,
  $service_name,
) {
  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }
}
