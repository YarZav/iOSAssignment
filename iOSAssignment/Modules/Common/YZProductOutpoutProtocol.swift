protocol YZProductOutpoutProtocol {
  /// Finish coordinator flow
  var onFinish: (() -> Void)? { get set }
}
