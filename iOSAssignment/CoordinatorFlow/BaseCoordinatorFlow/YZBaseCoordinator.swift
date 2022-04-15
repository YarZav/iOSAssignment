/// Default completion code block for coordinator flow
typealias YZCompletion = () -> Void

open class YZBaseCoordinator {
  // MARK: - Internal property

  lazy var childCoordinators: [YZCoordinatorProtocol] = []
}

// MARK: - Publics

extension YZBaseCoordinator {
  func addDependency(_ coordinator: YZCoordinatorProtocol) {
    if !childCoordinators.contains(where: { $0 === coordinator }) {
      childCoordinators.append(coordinator)
    }
  }

  func removeDependency(_ coordinator: YZCoordinatorProtocol?) {
    guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
    childCoordinators.removeAll { $0 === coordinator }
  }
}
