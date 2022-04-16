import UIKit

protocol YZKeyboardManagerDelegate: AnyObject {
  /// Height of keyboard
  func onChangeHeight(_ height: CGFloat)
}

final class YZKeyboardManager {
  // MARK: - YZKeyboardManagerProtocol

  weak var delegate: YZKeyboardManagerDelegate?

  // MARK: - Init

  init() {
    addObservers()
  }

  func removeObservers() {
    NotificationCenter.default.removeObserver(self)
  }
}

// MARK: - Private

private extension YZKeyboardManager {
  func addObservers() {
    let notification = NotificationCenter.default
    notification.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    notification.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
}

// MARK: - Action

private extension YZKeyboardManager {
  @objc
  func keyboardWillShow(notification: Notification) {
    let userInfoKey = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
    guard let keyboardHeight = (userInfoKey as? NSValue)?.cgRectValue.height else { return }
    delegate?.onChangeHeight(keyboardHeight)
  }

  @objc
  func keyboardWillHide(notification: Notification) {
    delegate?.onChangeHeight(0)
  }
}
