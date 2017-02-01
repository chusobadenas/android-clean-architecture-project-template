buildscript {
  repositories {
    maven {
	  url 'https://plugins.gradle.org/m2/'
	  }
	}
    dependencies {
        classpath 'com.neenbedankt.gradle.plugins:android-apt:${aptPluginVersion}'
        classpath 'net.ltgt.gradle:gradle-apt-plugin:${netAptPluginVersion}'
    }
}

task wrapper(type: Wrapper) {
    gradleVersion = '${gradleWrapperVersion}'
}

subprojects { subproject ->
    if (subproject.name.startsWith('app')) {
        apply plugin: 'com.android.application'
        apply plugin: 'com.neenbedankt.android-apt'
        apply plugin: 'net.ltgt.apt'
    }
}
