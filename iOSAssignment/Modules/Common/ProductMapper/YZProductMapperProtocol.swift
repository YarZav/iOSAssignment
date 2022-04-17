protocol YZProductMapperProtocol {
  /// Map Core Data model to Business model
  func map(from coreDataModels: [YZProductCoreDataModel]?) -> [YZProductModel]
}
