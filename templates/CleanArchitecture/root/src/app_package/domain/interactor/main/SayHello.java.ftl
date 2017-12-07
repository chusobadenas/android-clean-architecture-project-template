package ${packageName}.domain.interactor.main;

import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.domain.interactor.UseCase;
import ${packageName}.domain.repository.MainRepository;

import javax.inject.Inject;

import io.reactivex.Observable;

/**
 * This class is an implementation of {@link UseCase} in order to say hello.
 */
public class SayHello extends UseCase {

  private final MainRepository mainRepository;

  @Inject
  public SayHello(MainRepository mainRepository, ThreadExecutor threadExecutor,
                        PostExecutionThread postExecutionThread) {
    super(threadExecutor, postExecutionThread);
    this.mainRepository = mainRepository;
  }

  @Override
  public Observable buildUseCaseObservable(Object... param) {
    String str = (String) param[0];
    return mainRepository.saySomething(str);
  }
}
