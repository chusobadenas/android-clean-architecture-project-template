package ${packageName}.common.di.modules;

import ${packageName}.common.di.PerActivity;
import ${packageName}.presentation.base.BaseFragment;
import ${packageName}.presentation.main.MainFragment;
import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
public abstract class FragmentBindingsModule {

  @PerActivity
  @ContributesAndroidInjector
  abstract BaseFragment contributeBaseFragmentInjector();

  @PerActivity
  @ContributesAndroidInjector(modules = MainModule.class)
  abstract MainFragment contributeMainFragmentInjector();
}
