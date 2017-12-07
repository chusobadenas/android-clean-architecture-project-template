buildscript {
  repositories {
    mavenCentral()
    maven {
	  url 'https://plugins.gradle.org/m2/'
	  }
	}
}

task wrapper(type: Wrapper) {
    gradleVersion = '${gradleWrapperVersion}'
}

subprojects { subproject ->
    if (subproject.name.startsWith('app')) {
        apply plugin: 'com.android.application'
    }
}
