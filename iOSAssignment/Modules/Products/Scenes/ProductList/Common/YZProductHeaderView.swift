import UIKit

protocol YZProductHeaderDelegate: AnyObject {
  /// Tap on sorting
  func didSort(_ isDesc: Bool)
}

final class YZProductHeaderView: UIView {
  // MARK: - Constants

  private enum Constants {
    static let productsText: String = NSLocalizedString("ProductsKey", comment: "")
    static let sortImageName: String = "arrow.up.arrow.down"
  }

  // MARK: - Private property

  private var isDesc: Bool = false

  private lazy var titleLabel = UILabel.make(with: 15)
  private lazy var sortButton = UIButton.make(
    cornerRadius: YZConstants.buttonHeight / 2 / 1.3,
    image: UIImage(systemName: Constants.sortImageName)?.colored(.black),
    borderColor: .black,
    borderWidth: 1,
    backgroundColor: .white,
    highlightedColor: .systemYellow,
    target: self,
    action: #selector(onSort)
  )

  // MARK: - Internal

  weak var delegate: YZProductHeaderDelegate?
  var products: [YZProductModel]? {
    didSet {
      if let count = products?.count {
        titleLabel.text = "\(count) \(Constants.productsText)"
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

// MARK: - Action

private extension YZProductHeaderView {
  @objc
  func onSort() {
    delegate?.didSort(isDesc)
    isDesc = !isDesc
  }
}

// MARK: - Private

private extension YZProductHeaderView {
  func createUI() {
    addSubview(titleLabel)
    addSubview(sortButton)

    [titleLabel, sortButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: YZConstants.smallMargin),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -YZConstants.smallMargin),
      titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: YZConstants.defaultMargin),

      sortButton.topAnchor.constraint(equalTo: topAnchor, constant: YZConstants.smallMargin),
      sortButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -YZConstants.smallMargin),
      sortButton.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: YZConstants.defaultMargin),
      sortButton.widthAnchor.constraint(equalToConstant: YZConstants.buttonHeight / 1.3),
      sortButton.heightAnchor.constraint(equalToConstant: YZConstants.buttonHeight / 1.3),
      sortButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -YZConstants.defaultMargin)
    ])
  }
}

