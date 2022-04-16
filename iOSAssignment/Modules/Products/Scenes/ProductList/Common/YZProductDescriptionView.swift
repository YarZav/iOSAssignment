import UIKit

final class YZProductDescriptionView: UIView {
  // MARK: - Constants

  private enum Constants {
    static let contents: String = "Inhoud:"
  }

  // MARK: - Private property

  private lazy var titleLabel = UILabel.make(with: 15, numberOfLines: 2)
  private lazy var quantityLabel = UILabel.make(with: 13, textColor: .systemGray)

  // MARK: - Internal

  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }

  var quantity: String? {
    didSet {
      if let quantity = quantity, !quantity.isEmpty {
        quantityLabel.text = "\(Constants.contents) \(quantity)"
      }
    }
  }

  // MARK: - Init

  init() {
    super.init(frame: .zero)
    createUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private

private extension YZProductDescriptionView {
  func createUI() {
    addSubview(titleLabel)
    addSubview(quantityLabel)

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    quantityLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
      titleLabel.rightAnchor.constraint(equalTo: rightAnchor),

      quantityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      quantityLabel.leftAnchor.constraint(equalTo: leftAnchor),
      quantityLabel.rightAnchor.constraint(equalTo: rightAnchor),
    ])
  }
}

