package ${packageName}.common.di.components;

import android.content.Context;

import ${packageName}.AndroidApplication;
import ${packageName}.common.di.ApplicationContext;
import ${packageName}.common.di.modules.ActivityBindingsModule;
import ${packageName}.common.di.modules.ApplicationModule;
import ${packageName}.common.di.modules.FragmentBindingsModule;
import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.data.repository.remote.APIService;
import ${packageName}.data.repository.UserDataRepository;
import ${packageName}.presentation.navigation.Navigator;
import dagger.BindsInstance;
import dagger.Component;
import dagger.android.AndroidInjectionModule;
import dagger.android.AndroidInjector;

import javax.inject.Singleton;

/**
 * A component whose lifetime is the life of the application.
 */
@Singleton
@Component(modules = {
    AndroidInjectionModule.class,
    ActivityBindingsModule.class,
    FragmentBindingsModule.class,
    ApplicationModule.class
})
public interface ApplicationComponent extends AndroidInjector<AndroidApplication> {

  @Component.Builder
  interface Builder {

    ApplicationComponent build();

    @BindsInstance
    Builder application(AndroidApplication application);
  }

  APIService apiService();

  @ApplicationContext
  Context context();

  UserDataRepository userDataRepository();

  Navigator navigator();

  PostExecutionThread postExecutionThread();

  ThreadExecutor threadExecutor();
}
