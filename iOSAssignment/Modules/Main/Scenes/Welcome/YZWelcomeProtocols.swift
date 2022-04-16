protocol YZWelcomeOutputProtocol {
  /// Tapped on welcome button to continue
  var onFinish: (() -> Void)? { get set }
}
