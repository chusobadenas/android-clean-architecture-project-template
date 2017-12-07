package ${packageName}.common.di.components;

import android.content.Context;

import ${packageName}.common.di.ApplicationContext;
import ${packageName}.common.di.modules.ApplicationModule;
import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.data.repository.remote.APIService;
import ${packageName}.data.repository.MainDataRepository;
import ${packageName}.presentation.base.BaseActivity;
import ${packageName}.presentation.navigation.Navigator;

import javax.inject.Singleton;

import dagger.Component;

/**
 * A component whose lifetime is the life of the application.
 */
@Singleton
@Component(modules = ApplicationModule.class)
public interface ApplicationComponent {

  void inject(BaseActivity baseActivity);

  APIService apiService();

  @ApplicationContext
  Context context();

  MainDataRepository mainDataRepository();

  Navigator navigator();

  PostExecutionThread postExecutionThread();

  ThreadExecutor threadExecutor();
}
