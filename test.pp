


windows_env {'JENKINS_BASE':
      ensure => present,
      variable => 'JENKINS_BASE',
      value => 'c:\jenkins',
      mergemode =>  clobber,
      before => Package['jenkins'],
 }

windows_env {'JENKINS_HOME':
      ensure => present,
      variable => 'JENKINS_HOME',
      value => 'c:\jenkins-data',
      mergemode =>  clobber,
      before => Package['jenkins'],
 }
 
 file {'c:\jenkins':
      ensure  => "directory",
      mode    => 0777,
      before => Package['jenkins'],
}

 file {'c:\jenkins-data':
      ensure  => "directory",
      mode    => 0777,
      before => Package['jenkins'],
}

exec {'install-jenkins-service':
      command => 'java -jar c:\dev\puppet\jenkins-1.617\jenkins.war',
}

 /*
 package {'jenkins':
      ensure => '1.617',
      source => 'c:\dev\puppet\jenkins-1.617\setup.exe',
}


exec {'install-jenkins-service':
      command => 'sc.exe create "jenkins" start=auto binPath="c:\\jenkins\\jenkins-slave.exe" DisplayName="Jenkins"',
}


file {'testfile':
      owner   => 'Michel',
      path    => 'c:/dev/puppet/testfile.txt',
      ensure  => present,
      mode    => 0777,
      content => "I'm a test file.",
}
*/