package ${packageName}.presentation.main;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.common.di.components.MainComponent;
import ${packageName}.presentation.base.BaseFragment;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import butterknife.Unbinder;

/**
 * Main fragment
 */
public class MainFragment extends BaseFragment implements MainMvpView {

    @Inject
    MainPresenter mainPresenter;

    @BindView(R.id.rl_progress)
    RelativeLayout progressView;
    @BindView(R.id.rl_retry)
    RelativeLayout retryView;
    @BindView(R.id.text_message)
    TextView textMessage;

    private Unbinder unbinder;

    /**
     * Creates a new instance of a MainFragment.
     */
    public static MainFragment newInstance() {
        return new MainFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getComponent(MainComponent.class).inject(this);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View fragmentView = inflater.inflate(R.layout.fragment_main, container, false);
        unbinder = ButterKnife.bind(this, fragmentView);
        mainPresenter.attachView(this);
        return fragmentView;
    }

    @Override
    public void onResume() {
        super.onResume();
        loadMessage();
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        unbinder.unbind();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mainPresenter.detachView();
    }

    @Override
    public void showLoading() {
        textMessage.setVisibility(View.GONE);
        progressView.setVisibility(View.VISIBLE);
    }

    @Override
    public void hideLoading() {
        textMessage.setVisibility(View.VISIBLE);
        progressView.setVisibility(View.GONE);
    }

    @Override
    public void showRetry() {
        textMessage.setVisibility(View.GONE);
        retryView.setVisibility(View.VISIBLE);
    }

    @Override
    public void hideRetry() {
        textMessage.setVisibility(View.VISIBLE);
        retryView.setVisibility(View.GONE);
    }

    @Override
    public void showError(String message) {
        showToastMessage(message);
    }

    @OnClick(R.id.bt_retry)
    void onButtonRetryClick() {
        loadMessage();
    }

    /**
     * Loads the message
     */
    private void loadMessage() {
        mainPresenter.initialize();
    }

    @Override
    public void showMessage(String message) {
        textMessage.setText(message);
    }

    @Override
    public Context context() {
        return getActivity();
    }
}
