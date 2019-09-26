package ${packageName}.presentation.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.widget.Toolbar;

import butterknife.BindView;
import butterknife.ButterKnife;
import ${packageName}.R;
import ${packageName}.presentation.base.BaseActivity;

/**
 * Main activity
 */
public class MainActivity extends BaseActivity {

  @BindView(R.id.toolbar)
  Toolbar toolbar;

  public static Intent getCallingIntent(Context context) {
    return new Intent(context, MainActivity.class);
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.${activityLayoutName});
    ButterKnife.bind(this);
    setSupportActionBar(toolbar);
    if (savedInstanceState == null) {
        addFragment(R.id.fragmentContainer, MainFragment.newInstance());
    }
  }
}
