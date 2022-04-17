protocol YZMainViewFactoryProtocol {
  /// Displaying view for welcome
  ///
  /// - Parameters:
  ///   - onFinish: Tapped on moved in the next view
  /// - Returns: View
  func welcome(_ onFinish: (() -> Void)?) -> YZPresenterProtocol & YZWelcomeOutputProtocol

  /// Displaying view with TabBar
  ///
  /// - Parameters:
  ///   - productListCoordinatorFlow: Product list coordinator flow
  /// - Returns: View
  func tabBar(list: YZProductListCoordinator, cart: YZProductCartCoordinator) -> YZPresenterProtocol
}
