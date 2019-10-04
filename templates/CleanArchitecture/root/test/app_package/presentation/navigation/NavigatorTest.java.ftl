package ${packageName}.presentation.navigation;

import android.content.ActivityNotFoundException;
import androidx.test.core.app.ApplicationProvider;

import ${packageName}.AndroidApplicationTest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.junit.Assert.fail;

@RunWith(RobolectricTestRunner.class)
@Config(application = AndroidApplicationTest.class, sdk = 27)
public class NavigatorTest {

  private Navigator navigator;

  @Before
  public void setUp() {
    navigator = new Navigator();
  }

  @Test
  public void testNavigateToMainSuccess() {
    try {
      navigator.navigateToMain(ApplicationProvider.getApplicationContext());
    } catch (ActivityNotFoundException exception) {
      fail("MainActivity not found");
    }
  }
}
