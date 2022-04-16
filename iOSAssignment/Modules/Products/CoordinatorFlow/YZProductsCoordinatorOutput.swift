protocol YZProductsCoordinatorOutput {
  /// Finished product list coordinator flow
  var onFinish: (() -> Void)? { get set }
}
