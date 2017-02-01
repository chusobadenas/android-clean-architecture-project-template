android {
    lintOptions {
        warning 'InvalidPackage'
    }
}

dependencies {
    testCompile "org.easymock:easymock:${easyMockVersion}"
    testCompile "org.mockito:mockito-core:${mockitoVersion}"
    testCompile "org.powermock:powermock-api-mockito:${powerMockVersion}"
    testCompile "org.powermock:powermock-api-easymock:${powerMockVersion}"
    testCompile "org.powermock:powermock-module-junit4:${powerMockVersion}"
    testCompile "org.robolectric:robolectric:${roboElectricVersion}"
    testCompile "org.robolectric:shadows-multidex:${roboElectricVersion}"
    apt "com.jakewharton:butterknife-compiler:${butterKnifeVersion}"
    apt "com.google.dagger:dagger-compiler:${daggerVersion}"
    apt "com.google.auto.value:auto-value:${autoValueVersion}"
    apt "com.ryanharter.auto.value:auto-value-gson:${autoValueGsonVersion}"
    provided "javax.annotation:jsr250-api:${jsr250Version}"
    provided "com.jakewharton.auto.value:auto-value-annotations:${autoValueVersion}"
    provided "com.ryanharter.auto.value:auto-value-gson:${autoValueGsonVersion}"
}
