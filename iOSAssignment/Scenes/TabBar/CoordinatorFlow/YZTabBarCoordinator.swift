final class YZTabBarCoordinator: YZBaseCoordinator, YZTabBarCoordinatorOutputProtocol {
  // MARK: - Private property

  private let factory: YZTabBarViewFactoryProtocol
  private let router: YZRouterProtocol

  // MARK: - Internal property

  var completion: YZCompletion?

  // MARK: - Init

  /// Init with 'factory', 'router', 'completion'
  /// - Parameters:
  ///     router: View routing
  ///     factory: View factory
  ///     completion: Completion
  /// - Returns: Coordinator flow
  init(
    router: YZRouterProtocol,
    factory: YZTabBarViewFactoryProtocol = YZTabBarViewFactory(),
    completion: YZCompletion? = nil
  ) {
    self.router = router
    self.factory = factory
    self.completion = completion
  }
}

// MARK: - Coordinatable
extension YZTabBarCoordinator: YZCoordinatorProtocol {
  func start() {
    tabBar()
  }
}

// MARK: - Private

private extension YZTabBarCoordinator {
  func tabBar() {
    let tabBar = factory.tabBar()
    router.setRoot(tabBar)
  }
}
