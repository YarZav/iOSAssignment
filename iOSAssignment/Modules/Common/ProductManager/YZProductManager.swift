import Foundation

protocol YZProductManagerDelegate: AnyObject {
  /// Core data did changed
  func didChanged()

  /// Core data did deleted
  func didDeleted()
}

final class YZProductManager {
  // MARK: - Private property

  private let observers = NSPointerArray.weakObjects()

  // MARK: - Singleton

  static let shared = YZProductManager()

  // MARK: - Init

  private init() { }
}

// MARK: - YZProductManagerProtocol

extension YZProductManager: YZProductManagerProtocol {
  func addObserver(_ observer: YZProductManagerDelegate?) {
    guard let observer = observer else { return }
    let pointer = Unmanaged.passUnretained(observer as AnyObject).toOpaque()
    observers.compact()
    observers.addPointer(pointer)
  }

  func didChanged() {
    let objects = observers.allObjects
    let delegates = objects.compactMap { $0 as? YZProductManagerDelegate }
    delegates.forEach { $0.didChanged() }
  }

  func didDeleted() {
    let objects = observers.allObjects
    let delegates = objects.compactMap { $0 as? YZProductManagerDelegate }
    delegates.forEach { $0.didDeleted() }
  }
}
