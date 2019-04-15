package ${packageName}.common.di.modules;

import ${packageName}.common.di.PerActivity;
import ${packageName}.presentation.base.BaseActivity;
import ${packageName}.presentation.main.MainActivity;
import ${packageName}.presentation.splash.SplashActivity;
import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
public abstract class ActivityBindingsModule {

  @PerActivity
  @ContributesAndroidInjector
  abstract BaseActivity contributeBaseActivityInjector();

  @PerActivity
  @ContributesAndroidInjector
  abstract SplashActivity contributeSplashActivityInjector();

  @PerActivity
  @ContributesAndroidInjector(modules = MainModule.class)
  abstract MainActivity contributeMainActivityInjector();
}
