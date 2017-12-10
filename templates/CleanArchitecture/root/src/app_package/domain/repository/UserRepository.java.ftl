package ${packageName}.domain.repository;

import ${packageName}.data.entity.User;

import io.reactivex.Observable;

/**
 * Interface that represents a Repository for getting user related data.
 */
public interface UserRepository {

  Observable<String> saySomething(User user, String str);
}
