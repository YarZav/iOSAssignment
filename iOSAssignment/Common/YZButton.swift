import UIKit

final class YZButton: UIButton {
  // MARK: - Private property

  private let plainColor: UIColor
  private let highlightedColor: UIColor

  // MARK: - Init

  init(plainColor: UIColor, highlightedColor: UIColor) {
    self.plainColor = plainColor
    self.highlightedColor = highlightedColor
    super.init(frame: .zero)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Override

  override var isHighlighted: Bool {
      didSet {
        backgroundColor = isHighlighted ? highlightedColor : plainColor
      }
  }
}
