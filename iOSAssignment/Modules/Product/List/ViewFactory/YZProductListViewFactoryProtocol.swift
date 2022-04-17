protocol YZProductListViewFactoryProtocol {
  /// Displaying view
  ///
  /// - Returns: View
  func productList() -> YZPresenterProtocol & YZProductOutpoutProtocol
}
