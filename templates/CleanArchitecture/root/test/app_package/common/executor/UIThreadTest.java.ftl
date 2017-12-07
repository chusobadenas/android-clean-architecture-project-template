package ${packageName}.common.executor;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import ${packageName}.AndroidApplicationTest;

import static org.junit.Assert.assertNotNull;

@RunWith(RobolectricTestRunner.class)
@Config(application = AndroidApplicationTest.class, sdk = 23)
public class UIThreadTest {

  @Test
  public void testGetSchedulerNotNull() {
    UIThread uiThread = new UIThread();
    assertNotNull(uiThread.getScheduler());
  }
}
