import CoreData

@objc(Product)
public final class YZProductCoreDataModel: NSManagedObject {

  // MARK: - CoreData

  public convenience init() {
    let manager = YZCoreDataManager.shared
    self.init(entity: manager.entityForName(entityName: YZProductCoreDataModel.entityName), insertInto: manager.managedObjectContext)
  }

  @nonobjc public class func fetchRequest() -> NSFetchRequest<YZProductCoreDataModel> {
    return NSFetchRequest<YZProductCoreDataModel>(entityName: YZProductCoreDataModel.entityName)
  }
}

// MARK: - Property

extension YZProductCoreDataModel: YZCoreDataModelIdentifiable {
  static var entityName: String = "Product"

  /// Title of product
  @NSManaged public var title: String

  /// Quantity of product
  @NSManaged public var quantity: String

  /// Price of product
  @NSManaged public var price: Double

  /// Price for hole unit
  @NSManaged public var unitPriceWithAmount: String

  /// URL as String for image
  @NSManaged public var imageUrl: String?

  /// Unique identifier for model
  @NSManaged public var id: String

  /// Count in the cart
  @NSManaged public var countInCart: Int16
}
