package ${packageName}.common.di.modules;

import android.content.Context;

import ${packageName}.AndroidApplication;
import ${packageName}.common.di.ApplicationContext;
import ${packageName}.common.executor.JobExecutor;
import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.common.executor.UIThread;
import ${packageName}.data.repository.remote.APIService;
import ${packageName}.data.repository.UserDataRepository;
import ${packageName}.domain.repository.UserRepository;

import dagger.Module;
import dagger.Provides;

import javax.inject.Singleton;

/**
 * Dagger module that provides objects which will live during the application lifecycle.
 */
@Module
public class ApplicationModule {

  @ApplicationContext
  @Provides
  @Singleton
  Context provideContext(AndroidApplication application) {
      return application.getApplicationContext();
  }

  @Provides
  @Singleton
  APIService provideApiService() {
      return APIService.Creator.newAPIService();
  }  

  @Provides
  @Singleton
  ThreadExecutor provideThreadExecutor(JobExecutor jobExecutor) {
      return jobExecutor;
  }

  @Provides
  @Singleton
  PostExecutionThread providePostExecutionThread(UIThread uiThread) {
      return uiThread;
  }

  @Provides
  @Singleton
  UserRepository provideUserRepository(UserDataRepository userDataRepository) {
    return userDataRepository;
  }
}
