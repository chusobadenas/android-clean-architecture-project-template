android {
  compileSdkVersion 28
  buildToolsVersion "28.0.3"
  defaultConfig {
    targetSdkVersion 28
  }
  lintOptions {
    warning 'InvalidPackage'
  }
  compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
  }
}
