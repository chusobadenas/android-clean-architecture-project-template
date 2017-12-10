package ${packageName}.common.di.modules;

import android.app.Activity;

import ${packageName}.common.di.PerActivity;

import dagger.Module;
import dagger.Provides;

/**
 * A module to wrap the Activity state and expose it to the graph.
 */
@Module
public class ActivityModule {

  private final Activity activity;

  /**
   * Constructor
   *
   * @param activity the activity
   */
  public ActivityModule(Activity activity) {
      this.activity = activity;
  }

  /**
   * Expose the activity to dependents in the graph.
   */
  @Provides
  @PerActivity
  Activity activity() {
    return activity;
  }
}
