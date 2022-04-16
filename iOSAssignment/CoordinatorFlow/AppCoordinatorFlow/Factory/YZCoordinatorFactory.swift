final class YZCoordinatorFactory: YZCoordinatorFactoryProtocol {
  // MARK: - YZCoordinatorFactoryProtocol

  func tabBarCoordinator(
    router: YZRouterProtocol
  ) -> YZCoordinatorProtocol {
    YZTabBarCoordinator(router: router)
  }
}
