android {
  compileSdkVersion 29
  buildToolsVersion "29.0.2"
  defaultConfig {
    targetSdkVersion 29
  }
  lintOptions {
    warning 'InvalidPackage'
  }
  compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
  }
}
