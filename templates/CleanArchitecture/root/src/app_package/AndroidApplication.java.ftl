package ${packageName};

import android.app.Application;

import ${packageName}.common.di.HasComponent;
import ${packageName}.common.di.components.ApplicationComponent;
import ${packageName}.common.di.components.DaggerApplicationComponent;
import ${packageName}.common.di.modules.ApplicationModule;

public class AndroidApplication extends Application implements HasComponent<ApplicationComponent> {

    private ApplicationComponent mApplicationComponent;

    @Override
    public void onCreate() {
        super.onCreate();
        initializeInjector();
    }

    @Override
    public ApplicationComponent getComponent() {
        return mApplicationComponent;
    }

    private void initializeInjector() {
        mApplicationComponent = DaggerApplicationComponent.builder()
            .applicationModule(new ApplicationModule(this))
            .build();
    }
}
