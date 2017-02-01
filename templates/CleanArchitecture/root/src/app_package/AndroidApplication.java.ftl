package ${packageName};

import android.app.Application;

import ${packageName}.common.di.HasComponent;
import ${packageName}.common.di.components.ApplicationComponent;
import ${packageName}.common.di.components.DaggerApplicationComponent;
import ${packageName}.common.di.modules.ApplicationModule;

import timber.log.Timber;

public class AndroidApplication extends Application implements HasComponent<ApplicationComponent> {

    private ApplicationComponent applicationComponent;

    @Override
    public void onCreate() {
        super.onCreate();
        initializeInjector();
        initializeTimber();
    }

    @Override
    public ApplicationComponent getComponent() {
        return applicationComponent;
    }

    private void initializeInjector() {
        applicationComponent = DaggerApplicationComponent.builder()
            .applicationModule(new ApplicationModule(this))
            .build();
    }

    private void initializeTimber() {
        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree());
        }
    }
}
