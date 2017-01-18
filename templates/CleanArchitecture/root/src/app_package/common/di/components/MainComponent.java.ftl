package ${packageName}.common.di.components;

import ${packageName}.common.di.PerActivity;
import ${packageName}.common.di.modules.ActivityModule;
import ${packageName}.presentation.main.MainFragment;

import dagger.Component;

/**
 * A scope {@link PerActivity} component.
 */
@PerActivity
@Component(dependencies = ApplicationComponent.class, modules = {ActivityModule.class})
public interface MainComponent extends ActivityComponent {

    void inject(MainFragment mainFragment);
}
