package ${packageName}.presentation.splash;

import android.os.Bundle;

import ${packageName}.presentation.base.BaseActivity;

/**
 * Activity that shows the splash screen
 */
public class SplashActivity extends BaseActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      getNavigator().navigateToMain(this);
      finish();
  }
}
