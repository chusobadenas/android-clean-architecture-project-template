android {
  compileSdkVersion 27
  buildToolsVersion "27.0.2"
  defaultConfig {
    targetSdkVersion 27
  }
  lintOptions {
    warning 'InvalidPackage'
  }
}

dependencies {
  testImplementation "org.easymock:easymock:${easyMockVersion}"
  testImplementation "org.mockito:mockito-core:${mockitoVersion}"
  testImplementation "org.powermock:powermock-api-mockito:${powerMockVersion}"
  testImplementation "org.powermock:powermock-api-easymock:${powerMockVersion}"
  testImplementation "org.powermock:powermock-module-junit4:${powerMockVersion}"
  testImplementation "org.robolectric:robolectric:${roboElectricVersion}"
  testImplementation "org.robolectric:shadows-support-v4:${roboElectricShadowsVersion}"
  annotationProcessor "com.github.bumptech.glide:compiler:${glideVersion}"
  annotationProcessor "com.google.auto.value:auto-value:${autoValueVersion}"
  annotationProcessor "com.google.dagger:dagger-compiler:${daggerVersion}"
  annotationProcessor "com.jakewharton:butterknife-compiler:${butterKnifeVersion}"
  annotationProcessor "com.ryanharter.auto.value:auto-value-gson:${autoValueGsonVersion}"
  compileOnly "com.jakewharton.auto.value:auto-value-annotations:1.5"
  compileOnly "com.ryanharter.auto.value:auto-value-gson:${autoValueGsonVersion}"
  compileOnly "javax.annotation:jsr250-api:${jsr250Version}"
}
