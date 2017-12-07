package ${packageName}.data.repository;

import ${packageName}.data.repository.remote.APIService;
import ${packageName}.domain.repository.MainRepository;

import javax.inject.Inject;
import javax.inject.Singleton;

import io.reactivex.Observable;

/**
 * {@link MainRepository} for retrieving main data.
 */
@Singleton
public class MainDataRepository implements MainRepository {

  private final APIService apiService;

  /**
   * Constructs a {@link MainRepository}.
   *
   * @param apiService  API service
   */
  @Inject
  public MainDataRepository(APIService apiService) {
    this.apiService = apiService;
  }

  @Override
  public Observable<String> saySomething(String str) {
    return Observable.just(str);
  }
}
