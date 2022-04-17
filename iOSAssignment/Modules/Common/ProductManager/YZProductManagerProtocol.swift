protocol YZProductManagerProtocol {
  /// Add observers
  func addObserver(_ observer: YZProductManagerDelegate?)

  /// Core data did changed
  func didChanged()

  /// Core data did deleted
  func didDeleted()
}
