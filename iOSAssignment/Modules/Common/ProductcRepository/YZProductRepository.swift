import CoreData

final class YZProductRepository {
  // MARK: - Private property

  private let coreDataManager: YZCoreDataManager
  private let productManager: YZProductManagerProtocol

  // MARK: - Init

  init(
    coreDataManager: YZCoreDataManager = YZCoreDataManager.shared,
    productManager: YZProductManagerProtocol = YZProductManager.shared
  ) {
    self.coreDataManager = coreDataManager
    self.productManager = productManager
  }
}

// MARK: - YZProductManagerProtocol

extension YZProductRepository: YZProductRepositoryProtocol {
  func getAll() -> [YZProductCoreDataModel]? {
    coreDataManager.getCoreDataModels(entityName: YZProductCoreDataModel.entityName)
  }

  func save(_ model: YZProductModel, callback: @escaping (Error?) -> Void) {
    /// Request to find model old model
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(
      entityName: YZProductCoreDataModel.entityName
    )
    fetchRequest.predicate = NSPredicate(format: "id = %@", model.id)
    let oldModel = try? coreDataManager.managedObjectContext.fetch(fetchRequest)

    /// Update or save new model
    if let oldModelForUpdate = oldModel?.first as? YZProductCoreDataModel {
      oldModelForUpdate.countInCart = model.countInCart
    } else {
      let coreDataModel = YZProductCoreDataModel()
      coreDataModel.id = model.id
      coreDataModel.title = model.title
      coreDataModel.quantity = model.quantity
      coreDataModel.price = model.price
      coreDataModel.unitPriceWithAmount = model.unitPriceWithAmount
      coreDataModel.imageUrl = model.imageUrl?.absoluteString
      coreDataModel.countInCart = model.countInCart
      var prevModels = getAll()
      prevModels?.append(coreDataModel)
    }
    coreDataManager.saveContext(callback: callback)
    productManager.didChanged()
  }

  func delete(by id: String, callback: @escaping (Error?) -> Void) {
    let model = getAll()?.first(where: { $0.id == id })
    guard let previousCoreDataModel = model else { return callback(nil) }
    coreDataManager.managedObjectContext.delete(previousCoreDataModel)
    coreDataManager.saveContext(callback: callback)
    productManager.didDeleted()
  }
}

