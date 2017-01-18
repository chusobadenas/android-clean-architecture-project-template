package ${packageName}.presentation.main;

import android.content.Context;

import ${packageName}.R;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class MainPresenterTest {

    private MainPresenter mMainPresenter;

    @Mock
    private Context mMockContext;
    @Mock
    private MainMvpView mMockMainMvpView;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mMainPresenter = new MainPresenter();
        mMainPresenter.attachView(mMockMainMvpView);

        when(mMockMainMvpView.context()).thenReturn(mMockContext);
        when(mMockContext.getString(R.string.sample_text)).thenReturn("Hello, world!");
    }

    @Test
    public void testAttachViewSuccess() {
        assertNotNull(mMainPresenter.getMvpView());
    }

    @Test
    public void testDetachViewSuccess() {
        mMainPresenter.detachView();
        assertNull(mMainPresenter.getMvpView());
    }

    @Test
    public void testInitializeSuccess() {
        mMainPresenter.initialize();
        verify(mMockMainMvpView).hideRetry();
        verify(mMockMainMvpView).showLoading();
        verify(mMockMainMvpView).showMessage("Hello, world!");
    }
}
