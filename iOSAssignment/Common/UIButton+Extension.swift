import UIKit

extension UIButton {
  /// Plain button
  ///
  /// - Parameters:
  ///   - cornerRadius: Corner radius for button
  ///   - title: Title text for button
  ///   - image: Image for button
  ///   - borderColor: Border color for button
  ///   - borderWidth: Border width
  ///   - backgroundColor: Background color button
  ///   - highlightedColor: Highlighted color button
  ///   - target: Action target for touch up inside
  ///   - action: Action
  static func plain(
    cornerRadius: CGFloat,
    title: String? = nil,
    image: UIImage? = nil,
    borderColor: UIColor? = .black,
    borderWidth: CGFloat = 1,
    backgroundColor: UIColor = .white,
    highlightedColor: UIColor = .systemYellow,
    target: Any? = nil,
    action: Selector? = nil
  ) -> UIButton {
    let button = YZButton(plainColor: backgroundColor, highlightedColor: highlightedColor)
    button.setTitle(title, for: .normal)
    button.setImage(image, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.borderWidth = borderWidth
    button.layer.cornerRadius = cornerRadius
    if let borderColor = borderColor {
      button.layer.borderColor = borderColor.cgColor
    }
    if let target = target, let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    return button
  }
}
