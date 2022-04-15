final class YZCoordinatorFactory: YZCoordinatorFactoryProtocol {
  // MARK: - YZCoordinatorFactoryProtocol

  func tabBarCoordinator(
    router: YZRouterProtocol
  ) -> YZCoordinatorProtocol & YZTabBarCoordinatorOutputProtocol {
    YZTabBarCoordinator(router: router)
  }
}
