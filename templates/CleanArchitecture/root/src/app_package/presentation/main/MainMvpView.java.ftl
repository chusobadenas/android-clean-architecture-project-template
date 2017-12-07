package ${packageName}.presentation.main;

import ${packageName}.presentation.base.MvpView;

/**
 * Interface representing a View in a model view presenter (MVP) pattern.
 */
interface MainMvpView extends MvpView {

  /**
   * Shows a message in the view.
   *
   * @param message The message that will be shown.
   */
  void showMessage(String message);
}
