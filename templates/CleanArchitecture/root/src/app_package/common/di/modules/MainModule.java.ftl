package ${packageName}.common.di.modules;

import ${packageName}.common.di.PerActivity;
import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.data.repository.UserDataRepository;
import ${packageName}.domain.interactor.UseCase;
import ${packageName}.domain.interactor.main.SayHello;

import javax.inject.Named;

import dagger.Module;
import dagger.Provides;

/**
 * Dagger Module that provides main related collaborators.
 */
@Module
public class MainModule {

  @Provides
  @PerActivity
  @Named("sayHello")
  UseCase provideSayHello(UserDataRepository userDataRepository, ThreadExecutor
      threadExecutor, PostExecutionThread postExecutionThread) {
    return new SayHello(userDataRepository, threadExecutor, postExecutionThread);
  }
}
