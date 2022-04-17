protocol YZProductCartViewFactoryProtocol {
  /// Displaying view
  ///
  /// - Returns: View
  func productCart() -> YZPresenterProtocol & YZProductOutpoutProtocol
}
