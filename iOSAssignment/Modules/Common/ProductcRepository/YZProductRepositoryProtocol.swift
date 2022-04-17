protocol YZProductRepositoryProtocol {
  /// Get all data for product list
  func getAll() -> [YZProductCoreDataModel]?

  /// Create new product in Core Data
  func save(_ model: YZProductModel, callback: @escaping (Error?) -> Void)

  /// Delete product in Core Data
  func delete(by id: String, callback: @escaping (Error?) -> Void)
}
