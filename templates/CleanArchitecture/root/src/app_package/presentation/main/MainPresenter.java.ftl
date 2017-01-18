package ${packageName}.presentation.main;

import ${packageName}.R;
import ${packageName}.common.di.PerActivity;
import ${packageName}.presentation.base.BasePresenter;
import ${packageName}.presentation.base.Presenter;

import javax.inject.Inject;

/**
 * {@link Presenter} that controls communication between views and models of the presentation layer.
 */
@PerActivity
public class MainPresenter extends BasePresenter<MainMvpView> {

    @Inject
    public MainPresenter() {
        // Empty constructor
    }

    /**
     * Initializes the presenter by start retrieving the user list.
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
        MainMvpView mvpView = getMvpView();
        String message = mvpView.context().getString(R.string.sample_text);
        mvpView.hideLoading();
        mvpView.showMessage(message);
    }
}
