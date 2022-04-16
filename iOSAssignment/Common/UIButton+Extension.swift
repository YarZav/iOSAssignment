import UIKit

extension UIButton {
  static func make(
    title: String? = nil,
    image: UIImage? = nil,
    cornerRadius: CGFloat,
    borderColor: UIColor,
    backgroundColor: UIColor,
    target: Any? = nil,
    action: Selector? = nil
  ) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setImage(image, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = cornerRadius
    button.layer.borderColor = borderColor.cgColor
    if let target = target, let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    return button
  }
}
