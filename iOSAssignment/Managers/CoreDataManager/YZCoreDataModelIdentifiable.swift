import Foundation

protocol YZCoreDataModelIdentifiable {

  /// DataBase model identifier
  var id: String { get set }

  /// DataBase name
  static var entityName: String { get }
}
