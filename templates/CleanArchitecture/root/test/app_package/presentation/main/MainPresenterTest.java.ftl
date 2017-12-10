package ${packageName}.presentation.main;

import android.content.Context;

import ${packageName}.R;
import ${packageName}.data.entity.User;
import ${packageName}.domain.interactor.DefaultSubscriber;
import ${packageName}.domain.interactor.main.SayHello;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class MainPresenterTest {

  private MainPresenter mainPresenter;

  @Mock
  private Context context;
  @Mock
  private SayHello sayHello;
  @Mock
  private MainMvpView mvpView;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    mainPresenter = new MainPresenter(sayHello);
    mainPresenter.attachView(mvpView);

    when(mvpView.context()).thenReturn(context);
    when(context.getString(R.string.sample_text)).thenReturn("Hello, world!");
  }

  @Test
  public void testAttachViewSuccess() {
    assertNotNull(mainPresenter.getMvpView());
  }

  @Test
  public void testDetachViewSuccess() {
    mainPresenter.detachView();
    assertNull(mainPresenter.getMvpView());
    verify(sayHello).unsubscribe();
  }

  @Test
  public void testInitializeSuccess() {
    mainPresenter.initialize();
    verify(mvpView).hideRetry();
    verify(mvpView).showLoading();
    verify(sayHello).execute(any(DefaultSubscriber.class), any(User.class), eq("Hello, world!"));
  }
}
