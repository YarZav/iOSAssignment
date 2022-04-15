protocol YZTabBarViewFactoryProtocol {
  /// Displaying view
  ///
  /// - Returns: View
  func tabBar() -> YZPresenterProtocol & YZTabBarOutputProtocol
}
