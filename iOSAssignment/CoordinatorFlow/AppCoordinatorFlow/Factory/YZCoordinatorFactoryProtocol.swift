protocol YZCoordinatorFactoryProtocol {
  /// Coordinator flow
  ///
  /// - Parameters:
  ///     - router:  Router for moving in stack of views
  func mainCoordinator(
    router: YZRouterProtocol
  ) -> YZCoordinatorProtocol
}
