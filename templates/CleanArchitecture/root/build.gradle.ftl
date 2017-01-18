buildscript {
    dependencies {
        classpath 'com.neenbedankt.gradle.plugins:android-apt:${aptPluginVersion}'
    }
}

task wrapper(type: Wrapper) {
    gradleVersion = '${gradleWrapperVersion}'
}

subprojects { subproject ->
    if (subproject.name.startsWith('app')) {
        apply plugin: 'com.android.application'
        apply plugin: 'com.neenbedankt.android-apt'
    }
}
