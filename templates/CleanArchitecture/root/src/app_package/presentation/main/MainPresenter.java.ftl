package ${packageName}.presentation.main;

import ${packageName}.R;
import ${packageName}.common.di.PerActivity;
import ${packageName}.domain.interactor.DefaultSubscriber;
import ${packageName}.domain.interactor.UseCase;
import ${packageName}.presentation.base.BasePresenter;
import ${packageName}.presentation.base.Presenter;

import javax.inject.Inject;
import javax.inject.Named;

/**
 * {@link Presenter} that controls communication between views and models of the presentation layer.
 */
@PerActivity
public class MainPresenter extends BasePresenter<MainMvpView> {

  private final UseCase sayHelloUseCase;

  @Inject
  public MainPresenter(@Named("sayHello") UseCase sayHelloUseCase) {
    this.sayHelloUseCase = sayHelloUseCase;
  }

  @Override
  public void detachView() {
    super.detachView();
    sayHelloUseCase.unsubscribe();
  }

  /**
   * Initializes the presenter.
   */
  void initialize() {
    checkViewAttached();
    loadMessage();
  }

  /**
   * Loads the message.
   */
  private void loadMessage() {
    MainMvpView mvpView = getMvpView();
    mvpView.hideRetry();
    mvpView.showLoading();
    getMessage();
  }

  private void getMessage() {
    String message = getMvpView().context().getString(R.string.sample_text);
    sayHelloUseCase.execute(new SayHelloSubscriber(), message);
  }

  private final class SayHelloSubscriber extends DefaultSubscriber<String> {

    @Override
    public void onError(Throwable throwable) {
      getMvpView().hideLoading();
      showErrorMessage(throwable, "Error getting the message", null);
      getMvpView().showRetry();
    }

    @Override
    public void onNext(String message) {
      getMvpView().hideLoading();
      getMvpView().showMessage(message);
    }
  }
}
