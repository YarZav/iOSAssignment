import UIKit

extension UILabel {
  /// Make plain UILabel
  ///
  /// - Parameters:
  ///   - textSize: text font size
  ///   - isBold: Is bold text
  ///   - numberOfLines: MAX number of lines in text
  ///   - textColor: text color
  ///   - textAlignment: text alignment (left, middle, right)
  static func plain(
    with textSize: CGFloat,
    isBold: Bool = false,
    numberOfLines: Int = 1,
    textColor: UIColor = .black,
    textAlignment: NSTextAlignment = .left
  )
  -> UILabel {
    let label = UILabel()
    label.numberOfLines = numberOfLines
    label.font = isBold ? .boldSystemFont(ofSize: textSize) : .systemFont(ofSize: textSize)
    label.textColor = textColor
    label.textAlignment = textAlignment
    return label
  }
}
