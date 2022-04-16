import UIKit

final class YZProductCell: UITableViewCell {
  // MARK: - Constants

  private enum Constants {
    static let contents: String = "Inhoud:"
    static let smallMargin: CGFloat = 8
    static let defaultMargin: CGFloat = 20
    static let buttonHeight: CGFloat = 44
    static let plusImage = UIImage(systemName: "plus")
  }

  // MARK: - Private property

  private lazy var productImageView = YZProductImageView()
  private lazy var titleLabel = UILabel.make(with: 15, numberOfLines: 2)
  private lazy var quantityLabel = UILabel.make(with: 13, textColor: .systemGray)
  private lazy var priceLabel = UILabel.make(with: 19, isBold: true, textAlignment: .right)
  private lazy var unitPriceLabel = UILabel.make(with: 13, textColor: .systemGray, textAlignment: .right)

  private lazy var addButton: UIButton = {
   UIButton.make(
      image: Constants.plusImage?.colored(.white),
      cornerRadius: Constants.buttonHeight / 2.0,
      borderColor: .systemGreen,
      backgroundColor: .systemGreen,
      target: nil,
      action: nil
    )
  }()

  // MARK: - Internal property

  var product: YZProduct? {
    didSet {
      titleLabel.text = product?.title
      if let quantity = product?.quantity, !quantity.isEmpty {
        quantityLabel.text = "\(Constants.contents) \(quantity)"
      }
      if let price = product?.price {
        priceLabel.text = "\(price)"
      }
      if let unitPrice = product?.unitPriceWithAmount, !unitPrice.isEmpty {
        unitPriceLabel.text = unitPrice
      }
      productImageView.load(with: product?.imageUrl)
    }
  }

  // MARK: - Init

  override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    createUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private

private extension YZProductCell {
  func createUI() {
    // MARK: - Containers

    let containerView = UIView()
    let containerLeftView = UIView()
    let containerMiddleView = UIView()
    let containerRightView = UIView()

    contentView.addSubview(containerView)
    containerView.addSubview(containerLeftView)
    containerView.addSubview(containerMiddleView)
    containerView.addSubview(containerRightView)

    // MARK: - Left sub views (image, title, quantity)

    containerView.addSubview(productImageView)
    containerLeftView.addSubview(titleLabel)
    containerLeftView.addSubview(quantityLabel)

    // MARK: - Middle sub views (price, unit price)

    containerMiddleView.addSubview(priceLabel)
    containerMiddleView.addSubview(unitPriceLabel)

    // MARK: - Right sub views (add button)

    containerRightView.addSubview(addButton)

    // MARK: - Mask

    [
      containerView,
      containerLeftView,
      containerMiddleView,
      containerRightView,
      productImageView,
      titleLabel,
      quantityLabel,
      priceLabel,
      unitPriceLabel,
      addButton
    ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    // MARK: - Constraints

    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.smallMargin),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.smallMargin),
      containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.defaultMargin),
      containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.defaultMargin),

      productImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
      productImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      productImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor),

      containerLeftView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.smallMargin),
      containerLeftView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      containerLeftView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: Constants.smallMargin),

      titleLabel.topAnchor.constraint(equalTo: containerLeftView.topAnchor),
      titleLabel.leftAnchor.constraint(equalTo: containerLeftView.leftAnchor),
      titleLabel.rightAnchor.constraint(equalTo: containerLeftView.rightAnchor),

      quantityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.smallMargin),
      quantityLabel.leftAnchor.constraint(equalTo: containerLeftView.leftAnchor),
      quantityLabel.rightAnchor.constraint(equalTo: containerLeftView.rightAnchor),

      containerMiddleView.topAnchor.constraint(equalTo: containerView.topAnchor),
      containerMiddleView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      containerMiddleView.leftAnchor.constraint(equalTo: containerLeftView.rightAnchor, constant: Constants.smallMargin),

      priceLabel.topAnchor.constraint(equalTo: containerMiddleView.topAnchor, constant: Constants.smallMargin),
      priceLabel.leftAnchor.constraint(equalTo: containerMiddleView.leftAnchor),
      priceLabel.rightAnchor.constraint(equalTo: containerMiddleView.rightAnchor),

      unitPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.smallMargin),
      unitPriceLabel.leftAnchor.constraint(equalTo: containerMiddleView.leftAnchor),
      unitPriceLabel.rightAnchor.constraint(equalTo: containerMiddleView.rightAnchor),

      containerRightView.topAnchor.constraint(equalTo: containerView.topAnchor),
      containerRightView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      containerRightView.leftAnchor.constraint(equalTo: containerMiddleView.rightAnchor, constant: Constants.smallMargin),
      containerRightView.rightAnchor.constraint(equalTo: containerView.rightAnchor),

      addButton.topAnchor.constraint(equalTo: containerRightView.topAnchor, constant: Constants.smallMargin),
      addButton.leftAnchor.constraint(equalTo: containerRightView.leftAnchor),
      addButton.rightAnchor.constraint(equalTo: containerRightView.rightAnchor),
      addButton.widthAnchor.constraint(equalToConstant: Constants.buttonHeight),
      addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor)
    ])
  }
}
