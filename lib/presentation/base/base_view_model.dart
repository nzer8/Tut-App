abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  // shared variable and functions that will be used through any view model.
}

abstract class BaseViewModelInput {
  void start(); // start view model job

  void dispose(); // will be called when view model dies.
}

mixin class BaseViewModelOutput {
  // will be implemented later
}
