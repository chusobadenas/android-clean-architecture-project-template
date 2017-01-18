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
    MainPresenter mMainPresenter;

    @BindView(R.id.rl_progress)
    RelativeLayout mViewProgress;
    @BindView(R.id.rl_retry)
    RelativeLayout mViewRetry;
    @BindView(R.id.text_message)
    TextView mTextMessage;

    private Unbinder mUnbinder;

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
        mUnbinder = ButterKnife.bind(this, fragmentView);
        mMainPresenter.attachView(this);
        setupView();
        return fragmentView;
    }

    @Override
    public void onStart() {
        super.onStart();
        loadMessage();
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        mUnbinder.unbind();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mMainPresenter.detachView();
    }

    @Override
    public void showLoading() {
        mTextMessage.setVisibility(View.GONE);
        mViewProgress.setVisibility(View.VISIBLE);
    }

    @Override
    public void hideLoading() {
        mTextMessage.setVisibility(View.VISIBLE);
        mViewProgress.setVisibility(View.GONE);
    }

    @Override
    public void showRetry() {
        mTextMessage.setVisibility(View.GONE);
        mViewRetry.setVisibility(View.VISIBLE);
    }

    @Override
    public void hideRetry() {
        mTextMessage.setVisibility(View.VISIBLE);
        mViewRetry.setVisibility(View.GONE);
    }

    @Override
    public void showError(String message) {
        showToastMessage(message);
    }

    @Override
    public Context context() {
        return getActivity();
    }

    private void setupView() {
        loadMessage();
    }

    /**
     * Loads the message
     */
    private void loadMessage() {
        mMainPresenter.initialize();
    }

    @OnClick(R.id.bt_retry)
    void onButtonRetryClick() {
        loadMessage();
    }

    @Override
    public void showMessage(String message) {
        mTextMessage.setText(message);
    }
}
