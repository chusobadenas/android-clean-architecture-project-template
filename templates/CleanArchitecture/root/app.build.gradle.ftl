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
    provided "javax.annotation:jsr250-api:${jsr250Version}"
}
