package ${packageName}.domain.interactor.main;

import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.data.entity.User;
import ${packageName}.domain.interactor.UseCase;
import ${packageName}.domain.repository.UserRepository;

import javax.inject.Inject;

import io.reactivex.Observable;

/**
 * This class is an implementation of {@link UseCase} in order to say hello.
 */
public class SayHello extends UseCase {

  private final UserRepository userRepository;

  @Inject
  public SayHello(UserRepository userRepository, ThreadExecutor threadExecutor,
                        PostExecutionThread postExecutionThread) {
    super(threadExecutor, postExecutionThread);
    this.userRepository = userRepository;
  }

  @Override
  public Observable buildUseCaseObservable(Object... param) {
    User user = (User) param[0];
    String str = (String) param[1];
    return userRepository.saySomething(user, str);
  }
}
