package ${packageName}.common.di.modules;

import android.content.Context;

import ${packageName}.AndroidApplication;
import ${packageName}.common.executor.JobExecutor;
import ${packageName}.common.executor.PostExecutionThread;
import ${packageName}.common.executor.ThreadExecutor;
import ${packageName}.common.executor.UIThread;
import ${packageName}.data.repository.remote.APIService;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

/**
 * Dagger module that provides objects which will live during the application lifecycle.
 */
@Module
public class ApplicationModule {

    private final AndroidApplication mApplication;

    /**
     * Constructor
     *
     * @param application the application
     */
    public ApplicationModule(AndroidApplication application) {
        this.mApplication = application;
    }

    @Provides
    @Singleton
    Context provideApplicationContext() {
        return mApplication;
    }

    @Provides
    @Singleton
    ThreadExecutor provideThreadExecutor(JobExecutor jobExecutor) {
        return jobExecutor;
    }

    @Provides
    @Singleton
    PostExecutionThread providePostExecutionThread(UIThread uiThread) {
        return uiThread;
    }

    @Provides
    @Singleton
    APIService provideApiService() {
        return APIService.Creator.newAPIService();
    }
}
