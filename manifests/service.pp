# Class: jenkins::service
#
class jenkins::service {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $::jenkins::manage_restart {
    service { 'jenkins':
      ensure     => $jenkins::service_ensure,
      enable     => $jenkins::service_enable,
      provider   => $jenkins::service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  } else {
    service { 'jenkins':
      ensure     => $jenkins::service_ensure,
      enable     => $jenkins::service_enable,
      provider   => $jenkins::service_provider,
      hasstatus  => true,
      hasrestart => true,
      restart    => '/usr/bin/true',
    }
  }
}
