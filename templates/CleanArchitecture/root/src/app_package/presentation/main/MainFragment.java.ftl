package ${packageName}.presentation.main;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import butterknife.Unbinder;

import ${packageName}.R;
import ${packageName}.presentation.base.BaseMvpFragment;

import javax.inject.Inject;

/**
 * Main fragment
 */
public class MainFragment extends BaseMvpFragment implements MainMvpView {

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
  public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
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
}
