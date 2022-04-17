final class YZCoordinatorFactory: YZCoordinatorFactoryProtocol {
  // MARK: - YZCoordinatorFactoryProtocol

  func mainCoordinator(
    router: YZRouterProtocol
  ) -> YZCoordinatorProtocol {
    YZMainCoordinator(router: router)
  }
}
