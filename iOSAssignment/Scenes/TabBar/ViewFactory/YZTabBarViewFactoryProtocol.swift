protocol YZTabBarViewFactoryProtocol {
  /// Displaying view
  ///
  /// - Parameters:
  ///   - productListCoordinatorFlow: Product list coordinator flow
  /// - Returns: View
  func tabBar(productListCoordinatorFlow: YZProductsCoordinator) -> YZPresenterProtocol
}
