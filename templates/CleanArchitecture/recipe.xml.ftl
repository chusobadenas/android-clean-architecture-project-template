<?xml version="1.0"?>
<recipe>
    <!-- Dependencies -->
    <dependency mavenUrl="com.google.android.gms:play-services-gcm:${playServicesVersion}"/>
    <dependency mavenUrl="com.android.support:appcompat-v7:${supportLibraryVersion}"/>
    <dependency mavenUrl="com.android.support:support-annotations:${supportLibraryVersion}"/>
    <dependency mavenUrl="com.android.support:design:${supportLibraryVersion}"/>
    <dependency mavenUrl="com.squareup.retrofit2:retrofit:${retrofitVersion}"/>
    <dependency mavenUrl="com.squareup.retrofit2:converter-gson:${retrofitVersion}"/>
    <dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava:${retrofitVersion}"/>
    <dependency mavenUrl="com.jakewharton:butterknife:${butterKnifeVersion}"/>
    <dependency mavenUrl="io.reactivex:rxjava:${rxJavaVersion}"/>
    <dependency mavenUrl="io.reactivex:rxandroid:${rxAndroidVersion}"/>
    <dependency mavenUrl="com.google.dagger:dagger:${daggerVersion}"/>

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

    <copy from="res/drawable-hdpi/splash.png"
            to="${escapeXmlAttribute(resOut)}/drawable-hdpi/splash.png"/>
    <copy from="res/drawable-mdpi/splash.png"
            to="${escapeXmlAttribute(resOut)}/drawable-mdpi/splash.png"/>
    <copy from="res/drawable-xhdpi/splash.png"
            to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/splash.png"/>
    <copy from="res/drawable-xxhdpi/splash.png"
            to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi/splash.png"/>
    <copy from="res/drawable-xxxhdpi/splash.png"
            to="${escapeXmlAttribute(resOut)}/drawable-xxxhdpi/splash.png"/>

    <!-- Layouts -->
    <copy from="res/layout/activity_main.xml"
            to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml"/>
    <copy from="res/layout/fragment_main.xml"
                to="${escapeXmlAttribute(resOut)}/layout/fragment_main.xml"/>
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
    <instantiate from="src/app_package/common/di/HasComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/HasComponent.java"/>
    <instantiate from="src/app_package/common/di/PerActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/PerActivity.java"/>

    <instantiate from="src/app_package/common/di/components/ActivityComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/components/ActivityComponent.java"/>
    <instantiate from="src/app_package/common/di/components/ApplicationComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/components/ApplicationComponent.java"/>
    <instantiate from="src/app_package/common/di/components/MainComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/components/MainComponent.java"/>
    <instantiate from="src/app_package/common/di/modules/ActivityModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/ActivityModule.java"/>
    <instantiate from="src/app_package/common/di/modules/ApplicationModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/di/modules/ApplicationModule.java"/>

    <instantiate from="src/app_package/common/exception/DefaultErrorBundle.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/exception/DefaultErrorBundle.java"/>
    <instantiate from="src/app_package/common/exception/ErrorBundle.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/exception/ErrorBundle.java"/>
    <instantiate from="src/app_package/common/exception/ErrorMessageFactory.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/exception/ErrorMessageFactory.java"/>
    <instantiate from="src/app_package/common/exception/NetworkConnectionException.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/exception/NetworkConnectionException.java"/>

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

    <!-- DATA -->
    <instantiate from="src/app_package/data/repository/local/FileManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/repository/local/FileManager.java"/>
    <instantiate from="src/app_package/data/repository/remote/APIService.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/repository/remote/APIService.java"/>

    <!-- DOMAIN -->
    <instantiate from="src/app_package/domain/interactor/DefaultSubscriber.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/interactor/DefaultSubscriber.java"/>
    <instantiate from="src/app_package/domain/interactor/UseCase.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/interactor/UseCase.java"/>

    <!-- PRESENTATION -->
    <instantiate from="src/app_package/presentation/base/BaseActivity.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BaseActivity.java"/>
    <instantiate from="src/app_package/presentation/base/BaseFragment.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BaseFragment.java"/>
    <instantiate from="src/app_package/presentation/base/BasePresenter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/BasePresenter.java"/>
    <instantiate from="src/app_package/presentation/base/MvpView.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/MvpView.java"/>
    <instantiate from="src/app_package/presentation/base/Presenter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/presentation/base/Presenter.java"/>

    <instantiate from="src/app_package/presentation/main/MainActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/main/${activityClass}.java"/>
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
    <!-- COMMON -->
    <instantiate from="test/app_package/common/di/modules/ActivityModuleTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/di/modules/ActivityModuleTest.java"/>

    <instantiate from="test/app_package/common/exception/DefaultErrorBundleTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/exception/DefaultErrorBundleTest.java"/>
    <instantiate from="test/app_package/common/exception/ErrorMessageFactoryTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/exception/ErrorMessageFactoryTest.java"/>
    <instantiate from="test/app_package/common/exception/NetworkConnectionExceptionTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/exception/NetworkConnectionExceptionTest.java"/>

    <instantiate from="test/app_package/common/util/DialogFactoryTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/common/util/DialogFactoryTest.java"/>

    <!-- PRESENTATION -->
    <instantiate from="test/app_package/presentation/main/MainPresenterTest.java.ftl"
                   to="${escapeXmlAttribute(unitTestOut)}/presentation/main/MainPresenterTest.java"/>

    <!-- Open files to edit -->
    <open file="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml"/>
</recipe>
