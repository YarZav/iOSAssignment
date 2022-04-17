import UIKit

extension UIBarButtonItem {
  /// Make plain back button item
  ///
  /// - Parameters:
  ///   - target: Target of action
  ///   - action: Action for tap
  static func back(
    target: Any,
    action: Selector
  ) -> UIBarButtonItem {
    let button = UIBarButtonItem(
      image: UIImage(systemName: "chevron.backward"),
      style: .plain,
      target: target,
      action: action
    )
    button.tintColor = .black
    return button
  }
}
