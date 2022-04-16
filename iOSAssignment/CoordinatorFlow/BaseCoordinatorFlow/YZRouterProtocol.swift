/// Protocol to Pop, Push, Dismiss etc. views
protocol YZRouterProtocol: YZPresenterProtocol {
  // MARK: - Push

  /// Push view module with default animation
  func push(
    _ moduleTo: YZPresenterProtocol?
  )

  /// Push view module with animation
  func push(
    _ moduleTo: YZPresenterProtocol?,
    animated: Bool
  )

  /// Push view module with animation and completion block
  func push(
    _ moduleTo: YZPresenterProtocol?,
    animated: Bool,
    completion: YZCompletion?
  )

  // MARK: - New stack

  /// Set root view module
  func setRoot(_ module: YZPresenterProtocol?)

  /// Set root module and hide/show navigation bar
  func setRoot(_ module: YZPresenterProtocol?, hideBar: Bool)
}
