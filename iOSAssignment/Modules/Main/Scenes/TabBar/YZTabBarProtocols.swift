// INTERACTOR -> PRESENTER
protocol YZTabBarInteractorProtocol {
  /// Get count for badge
  func countInCart() -> Int
}

// VIEW -> PRESENTER
protocol YZTabBarPresenterProtocol {
  /// Action when view will load
  func viewWillAppear()
}

// PRESENTER -> VIEW
protocol YZTabBarViewProtocol: AnyObject {
  /// Reload badge
  func reloadBadge(_ count: Int)
}
