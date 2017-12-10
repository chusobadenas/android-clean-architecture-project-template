package ${packageName}.data.repository;

import ${packageName}.data.entity.User;
import ${packageName}.data.repository.remote.APIService;
import ${packageName}.domain.repository.UserRepository;

import javax.inject.Inject;
import javax.inject.Singleton;

import io.reactivex.Observable;

/**
 * {@link UserRepository} for retrieving user data.
 */
@Singleton
public class UserDataRepository implements UserRepository {

  private final APIService apiService;

  /**
   * Constructs a {@link UserRepository}.
   *
   * @param apiService  API service
   */
  @Inject
  public UserDataRepository(APIService apiService) {
    this.apiService = apiService;
  }

  @Override
  public Observable<String> saySomething(User user, String str) {
    String result = user.name() + " " + user.surname() + " says: " + str;
    return Observable.just(result);
  }
}
