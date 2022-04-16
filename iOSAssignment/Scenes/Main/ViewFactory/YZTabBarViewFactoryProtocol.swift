protocol YZTabBarViewFactoryProtocol {
  /// Displaying view with TabBar
  ///
  /// - Parameters:
  ///   - productListCoordinatorFlow: Product list coordinator flow
  /// - Returns: View
  func tabBar(productListCoordinatorFlow: YZProductsCoordinator) -> YZPresenterProtocol

  /// Displaying view for welcome
  ///
  /// - Parameters:
  ///   - onFinish: Tapped on moved in the next view
  /// - Returns: View
  func welcome(_ onFinish: (() -> Void)?) -> YZPresenterProtocol & YZWelcomeOutputProtocol
}
