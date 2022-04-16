import UIKit

final class YZProductCell: UITableViewCell {
  // MARK: - Constants

  private enum Constants {
    static let plusImageName = "plus"
  }

  // MARK: - Private property

  private lazy var productImageView = YZProductImageView()
  private lazy var descriptionView = YZProductDescriptionView()
  private lazy var priceView = YZPProductPriceView()
  private lazy var unitPriceLabel = UILabel.make(with: 13, textColor: .systemGray, textAlignment: .right)

  private lazy var addButton: UIButton = {
    UIButton.make(
      cornerRadius: YZConstants.buttonHeight / 2.0,
      image: UIImage(systemName: Constants.plusImageName)?.colored(.white),
      backgroundColor: .systemGreen,
      highlightedColor: .green
    )
  }()

  // MARK: - Internal property

  var product: YZProductModel? {
    didSet {
      descriptionView.title = product?.title
      descriptionView.quantity = product?.quantity
      priceView.price = product?.price
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
    let containerMiddleView = UIView()
    let containerRightView = UIView()

    contentView.addSubview(containerView)
    containerView.addSubview(containerMiddleView)
    containerView.addSubview(containerRightView)

    // MARK: - Left sub views (image, title, quantity)

    containerView.addSubview(productImageView)
    containerView.addSubview(descriptionView)

    // MARK: - Middle sub views (price, unit price)

    containerMiddleView.addSubview(priceView)
    containerMiddleView.addSubview(unitPriceLabel)

    // MARK: - Right sub views (add button)

    containerRightView.addSubview(addButton)

    // MARK: - Mask

    [
      containerView,
      containerMiddleView,
      containerRightView,
      productImageView,
      descriptionView,
      priceView,
      unitPriceLabel,
      addButton
    ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    // MARK: - Constraints

    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: YZConstants.smallMargin),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -YZConstants.smallMargin),
      containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: YZConstants.defaultMargin),
      containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -YZConstants.defaultMargin),

      productImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
      productImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      productImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor),

      descriptionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: YZConstants.smallMargin),
      descriptionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      descriptionView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: YZConstants.smallMargin),

      containerMiddleView.topAnchor.constraint(equalTo: containerView.topAnchor),
      containerMiddleView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      containerMiddleView.leftAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: YZConstants.smallMargin),

      priceView.topAnchor.constraint(equalTo: containerMiddleView.topAnchor, constant: YZConstants.smallMargin),
      priceView.leftAnchor.constraint(equalTo: containerMiddleView.leftAnchor),
      priceView.rightAnchor.constraint(equalTo: containerMiddleView.rightAnchor),

      unitPriceLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: YZConstants.smallMargin),
      unitPriceLabel.leftAnchor.constraint(equalTo: containerMiddleView.leftAnchor),
      unitPriceLabel.rightAnchor.constraint(equalTo: containerMiddleView.rightAnchor),

      containerRightView.topAnchor.constraint(equalTo: containerView.topAnchor),
      containerRightView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      containerRightView.leftAnchor.constraint(equalTo: containerMiddleView.rightAnchor, constant: YZConstants.smallMargin),
      containerRightView.rightAnchor.constraint(equalTo: containerView.rightAnchor),

      addButton.topAnchor.constraint(equalTo: containerRightView.topAnchor, constant: YZConstants.smallMargin),
      addButton.leftAnchor.constraint(equalTo: containerRightView.leftAnchor),
      addButton.rightAnchor.constraint(equalTo: containerRightView.rightAnchor),
      addButton.widthAnchor.constraint(equalToConstant: YZConstants.buttonHeight),
      addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor)
    ])
  }
}
