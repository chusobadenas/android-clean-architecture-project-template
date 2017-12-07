package ${packageName}.domain.repository;

import io.reactivex.Observable;

/**
 * Interface that represents a Repository for getting main related data.
 */
public interface MainRepository {

  Observable<String> saySomething(String str);
}
