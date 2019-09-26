package ${packageName}.presentation.base;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import androidx.fragment.app.Fragment;

import dagger.android.support.DaggerFragment;

/**
 * Base {@link Fragment} class for every fragment in this application.
 */
public abstract class BaseFragment extends DaggerFragment {

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setRetainInstance(true);
  }

  /*
   * onAttach(Context) is not called on pre API 23 versions of Android and onAttach(Activity) is deprecated
   * Use onAttachToContext instead
   */
  @TargetApi(23)
  @Override
  public void onAttach(Context context) {
    super.onAttach(context);
    onAttachToContext(context);
  }

  /*
   * Deprecated on API 23
   * Use onAttachToContext instead
   */
  @SuppressWarnings("deprecation")
  @Override
  public void onAttach(Activity activity) {
    super.onAttach(activity);
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
      onAttachToContext(activity);
    }
  }

  /**
   * Method to be overwritten by is child class if needed.
   *
   * @param context the context
   */
  protected void onAttachToContext(Context context) {
    // No-op by default
  }
}
