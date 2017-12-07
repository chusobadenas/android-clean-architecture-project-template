package ${packageName}.presentation.navigation;

import android.content.ActivityNotFoundException;

import ${packageName}.AndroidApplicationTest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import static org.junit.Assert.fail;

@RunWith(RobolectricTestRunner.class)
@Config(application = AndroidApplicationTest.class, sdk = 23)
public class NavigatorTest {

  private Navigator navigator;

  @Before
  public void setUp() {
    navigator = new Navigator();
  }

  @Test
  public void testNavigateToMainSuccess() {
    try {
      navigator.navigateToMain(RuntimeEnvironment.application);
    } catch (ActivityNotFoundException exception) {
      fail("MainActivity not found");
    }
  }
}
