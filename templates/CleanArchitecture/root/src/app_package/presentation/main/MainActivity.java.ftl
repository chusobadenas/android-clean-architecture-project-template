package ${packageName}.presentation.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import ${packageName}.R;
import ${packageName}.common.di.HasComponent;
import ${packageName}.common.di.components.DaggerMainComponent;
import ${packageName}.common.di.components.MainComponent;
import ${packageName}.presentation.base.BaseActivity;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Main activity
 */
public class MainActivity extends BaseActivity implements HasComponent<MainComponent> {

  @BindView(R.id.toolbar)
  Toolbar toolbar;

  private MainComponent mainComponent;

  public static Intent getCallingIntent(Context context) {
    return new Intent(context, MainActivity.class);
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.${activityLayoutName});
    ButterKnife.bind(this);
    initializeInjector();
    setSupportActionBar(toolbar);
    if (savedInstanceState == null) {
        addFragment(R.id.fragmentContainer, MainFragment.newInstance());
    }
  }

  private void initializeInjector() {
    mainComponent = DaggerMainComponent.builder()
        .applicationComponent(getApplicationComponent())
        .activityModule(getActivityModule())
        .build();
  }

  @Override
  public MainComponent getComponent() {
    return mainComponent;
  }
}
