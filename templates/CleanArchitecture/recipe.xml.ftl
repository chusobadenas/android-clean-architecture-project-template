<?xml version="1.0"?>
<recipe>
    <!-- Dependencies -->
    <dependency mavenUrl="androidx.appcompat:appcompat:${androidXVersion}"/>
    <dependency mavenUrl="androidx.vectordrawable:vectordrawable-animated:${androidXVersion}"/>
    <dependency mavenUrl="androidx.recyclerview:recyclerview:1.0.0"/>
    <dependency mavenUrl="androidx.cardview:cardview:1.0.0"/>
    <dependency mavenUrl="androidx.annotation:annotation:${androidXVersion}"/>
    <dependency mavenUrl="androidx.media:media:${androidXVersion}"/>
    <dependency mavenUrl="androidx.legacy:legacy-support-v4:1.0.0"/>
    <dependency mavenUrl="androidx.percentlayout:percentlayout:1.0.0"/>
    <dependency mavenUrl="com.google.android.material:material:1.0.0"/>
    <dependency mavenUrl="com.github.bumptech.glide:glide:${glideVersion}"/>
    <dependency mavenUrl="com.google.android.gms:play-services-gcm:${playServicesVersion}"/>
    <dependency mavenUrl="com.google.code.gson:gson:${gsonVersion}"/>
    <dependency mavenUrl="com.google.dagger:dagger:${daggerVersion}"/>
    <dependency mavenUrl="com.google.dagger:dagger-android:${daggerVersion}"/>
    <dependency mavenUrl="com.google.dagger:dagger-android-support:${daggerVersion}"/>
    <dependency mavenUrl="com.jakewharton:butterknife:${butterKnifeVersion}"/>
    <dependency mavenUrl="com.jakewharton.timber:timber:${timberVersion}"/>
    <dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:${interceptorVersion}"/>
    <dependency mavenUrl="com.squareup.retrofit2:retrofit:${retrofitVersion}"/>
    <dependency mavenUrl="com.squareup.retrofit2:converter-gson:${retrofitVersion}"/>
    <dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava2:${retrofitVersion}"/>
    <dependency mavenUrl="io.reactivex.rxjava2:rxandroid:${rxAndroidVersion}"/>
    <dependency mavenUrl="io.reactivex.rxjava2:rxjava:${rxJavaVersion}"/>
    <dependency mavenUrl="org.easymock:easymock:${easyMockVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="org.mockito:mockito-core:${mockitoVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="org.powermock:powermock-api-mockito2:${powerMockVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="org.powermock:powermock-api-easymock:${powerMockVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="org.powermock:powermock-module-junit4:${powerMockVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="org.robolectric:robolectric:${roboElectricVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="androidx.test:core:${androidXTestVersion}" gradleConfiguration="testImplementation"/>
    <dependency mavenUrl="com.google.auto.value:auto-value:${autoValueVersion}" gradleConfiguration="annotationProcessor"/>
    <dependency mavenUrl="com.google.auto.value:auto-value-annotations:${autoValueVersion}" gradleConfiguration="api"/>
    <dependency mavenUrl="com.ryanharter.auto.value:auto-value-gson:${autoValueGsonVersion}" gradleConfiguration="annotationProcessor"/>
    <dependency mavenUrl="com.jakewharton:butterknife-compiler:${butterKnifeVersion}" gradleConfiguration="annotationProcessor"/>
    <dependency mavenUrl="com.google.dagger:dagger-android-processor:${daggerVersion}" gradleConfiguration="annotationProcessor"/>
    <dependency mavenUrl="com.google.dagger:dagger-compiler:${daggerVersion}" gradleConfiguration="annotationProcessor"/>
    <dependency mavenUrl="com.github.bumptech.glide:compiler:${glideVersion}" gradleConfiguration="annotationProcessor"/>

    <dependency mavenUrl="com.jakewharton.auto.value:auto-value-annotations:${autoValueAnnotationsVersion}" gradleConfiguration="compileOnly"/>
    <dependency mavenUrl="com.ryanharter.auto.value:auto-value-gson:${autoValueGsonVersion}" gradleConfiguration="compileOnly"/>
    <dependency mavenUrl="javax.annotation:jsr250-api:${jsr250Version}" gradleConfiguration="compileOnly"/>

    <!-- Gradle -->
    <merge from="build.gradle.ftl"
             to="${escapeXmlAttribute(topOut)}/build.gradle"/>

    <merge from="app.build.gradle.ftl"
             to="${escapeXmlAttribute(appOut)}/build.gradle"/>

    <!-- Manifest -->
    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml"/>

    <!-- Resources -->
    <copy from="res/values/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml"/>
    <merge from="res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml"/>
    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml"/>
    <merge from="res/values/styles.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml"/>

    <!-- Drawable -->
    <copy from="res/drawable/background_splash.xml"
            to="${escapeXmlAttribute(resOut)}/drawable/background_splash.xml"/>

    <!-- Layouts -->
    <copy from="res/layout/activity_main.xml"
            to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml"/>
    <copy from="res/layout/fragment_main.xml"
                to="${escapeXmlAttribute(resOut)}/layout/fragment_main.xml"/>
    <copy from="res/layout/list_item_single_choice.xml"
                to="${escapeXmlAttribute(resOut)}/layout/list_item_single_choice.xml"/>
    <copy from="res/layout/loading_progress_view.xml"
                to="${escapeXmlAttribute(resOut)}/layout/loading_progress_view.xml"/>
    <copy from="res/layout/toolbar.xml"
                to="${escapeXmlAttribute(resOut)}/layout/toolbar.xml"/>
    <copy from="res/layout/view_progress.xml"
                to="${escapeXmlAttribute(resOut)}/layout/view_progress.xml"/>
    <copy from="res/layout/view_retry.xml"
                to="${escapeXmlAttribute(resOut)}/layout/view_retry.xml"/>

    <!-- Classes -->
    <instantiate from="src/app_package/AndroidApplication.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/AndroidApplication.java"/>

    <!-- COMMON -->
    <instantiate from="src/app_package/common/di/ApplicationContext.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/ApplicationContext.java"/>
    <instantiate from="src/app_package/common/di/PerActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/PerActivity.java"/>

    <instantiate from="src/app_package/common/di/components/ActivityComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/components/ActivityComponent.java"/>
    <instantiate from="src/app_package/common/di/components/ApplicationComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/components/ApplicationComponent.java"/>
    <instantiate from="src/app_package/common/di/modules/ActivityModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/ActivityModule.java"/>
    <instantiate from="src/app_package/common/di/modules/ApplicationModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/ApplicationModule.java"/>
    <instantiate from="src/app_package/common/di/modules/MainModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/MainModule.java"/>
    <instantiate from="src/app_package/common/di/modules/MyGlideModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/MyGlideModule.java"/>
    <instantiate from="src/app_package/common/di/modules/ActivityBindingsModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/ActivityBindingsModule.java"/>
    <instantiate from="src/app_package/common/di/modules/FragmentBindingsModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/FragmentBindingsModule.java"/>

    <instantiate from="src/app_package/common/exception/DefaultErrorBundle.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/exception/DefaultErrorBundle.java"/>
    <instantiate from="src/app_package/common/exception/ErrorBundle.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/exception/ErrorBundle.java"/>

    <instantiate from="src/app_package/common/executor/JobExecutor.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/executor/JobExecutor.java"/>
    <instantiate from="src/app_package/common/executor/PostExecutionThread.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/executor/PostExecutionThread.java"/>
    <instantiate from="src/app_package/common/executor/ThreadExecutor.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/executor/ThreadExecutor.java"/>
    <instantiate from="src/app_package/common/executor/UIThread.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/executor/UIThread.java"/>

    <instantiate from="src/app_package/common/util/DialogFactory.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/util/DialogFactory.java"/>
    <instantiate from="src/app_package/common/util/UIUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/util/UIUtils.java"/>

    <!-- DATA -->
    <instantiate from="src/app_package/data/entity/User.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/entity/User.java"/>
    <instantiate from="src/app_package/data/repository/remote/APIService.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/repository/remote/APIService.java"/>
    <instantiate from="src/app_package/data/repository/remote/GsonAdapterFactory.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/repository/remote/GsonAdapterFactory.java"/>
    <instantiate from="src/app_package/data/repository/UserDataRepository.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/repository/UserDataRepository.java"/>

    <!-- DOMAIN -->
    <instantiate from="src/app_package/domain/interactor/DefaultSubscriber.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/interactor/DefaultSubscriber.java"/>
    <instantiate from="src/app_package/domain/interactor/UseCase.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/interactor/UseCase.java"/>
    <instantiate from="src/app_package/domain/interactor/main/SayHello.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/interactor/main/SayHello.java"/>
    <instantiate from="src/app_package/domain/repository/UserRepository.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/repository/UserRepository.java"/>

    <!-- PRESENTATION -->
    <instantiate from="src/app_package/presentation/base/BaseActivity.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BaseActivity.java"/>
    <instantiate from="src/app_package/presentation/base/BaseMvpActivity.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BaseMvpActivity.java"/>
    <instantiate from="src/app_package/presentation/base/BaseFragment.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BaseFragment.java"/>
    <instantiate from="src/app_package/presentation/base/BaseMvpFragment.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BaseMvpFragment.java"/>
    <instantiate from="src/app_package/presentation/base/BasePresenter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BasePresenter.java"/>
    <instantiate from="src/app_package/presentation/base/MvpView.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/MvpView.java"/>
    <instantiate from="src/app_package/presentation/base/Presenter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/Presenter.java"/>

    <instantiate from="src/app_package/presentation/main/MainActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/main/${activityName}.java"/>
    <instantiate from="src/app_package/presentation/main/MainFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/main/MainFragment.java"/>
    <instantiate from="src/app_package/presentation/main/MainMvpView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/main/MainMvpView.java"/>
    <instantiate from="src/app_package/presentation/main/MainPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/main/MainPresenter.java"/>

    <instantiate from="src/app_package/presentation/navigation/Navigator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/navigation/Navigator.java"/>

    <instantiate from="src/app_package/presentation/splash/SplashActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/splash/SplashActivity.java"/>

    <!-- Unit tests -->
    <instantiate from="test/app_package/AndroidApplicationTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/AndroidApplicationTest.java"/>

    <!-- COMMON -->
    <instantiate from="test/app_package/common/di/modules/ActivityModuleTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/di/modules/ActivityModuleTest.java"/>

    <instantiate from="test/app_package/common/exception/DefaultErrorBundleTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/exception/DefaultErrorBundleTest.java"/>

    <instantiate from="test/app_package/common/executor/UIThreadTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/executor/UIThreadTest.java"/>

    <instantiate from="test/app_package/common/util/DialogFactoryTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/util/DialogFactoryTest.java"/>

    <!-- PRESENTATION -->
    <instantiate from="test/app_package/presentation/navigation/NavigatorTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/presentation/navigation/NavigatorTest.java"/>

    <instantiate from="test/app_package/presentation/splash/SplashActivityTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/presentation/splash/SplashActivityTest.java"/>

    <instantiate from="test/app_package/presentation/main/MainPresenterTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/presentation/main/MainPresenterTest.java"/>

    <!-- Open files to edit -->
    <open file="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml"/>
</recipe>
