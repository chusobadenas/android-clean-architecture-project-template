package ${packageName};

import ${packageName}.common.di.components.DaggerApplicationComponent;
import dagger.android.AndroidInjector;
import dagger.android.DaggerApplication;

import timber.log.Timber;

public class AndroidApplication extends DaggerApplication {

  @Override
  public void onCreate() {
      super.onCreate();
      initializeTimber();
  }

  @Override
  protected AndroidInjector<? extends DaggerApplication> applicationInjector() {
      return DaggerApplicationComponent.builder()
          .application(this)
          .build();
  }

  private void initializeTimber() {
      if (BuildConfig.DEBUG) {
          Timber.plant(new Timber.DebugTree());
      }
  }
}
