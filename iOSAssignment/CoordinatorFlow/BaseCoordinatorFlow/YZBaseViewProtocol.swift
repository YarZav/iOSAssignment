/**
 Base view protocol to add and remove children coordinator flow
 */
protocol YZBaseViewProtocol: YZPresenterProtocol {
  /// Add new coordinator flow as a dependency for current coordinator flow for routing
  ///
  /// - Parameters:
  ///     - coordinator: New coordinator flow as dependency.
  func addDependency(_ coordinator: YZCoordinatorProtocol)

  /// Remove coordinator flow as a dependency for current coordinator flow for routing
  ///
  /// - Parameters:
  ///     - coordinator: Coordinator floe to delete after finished.
  func removeDependency(_ coordinator: YZCoordinatorProtocol?)
}
