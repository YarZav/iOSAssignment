import UIKit

protocol YZProductCellDelegate: AnyObject {
  /// Did tap on button
  func onTap(model: YZProductModel?)
}

final class YZProductCell: UITableViewCell {
  // MARK: - Constants

  private enum Constants {
    static let plusImageName = "plus"
    static let minusImageName = "minus"
    static let buttonImageSize: CGSize = .init(width: 14, height: 14)
  }

  // MARK: - Private property

  private lazy var productImageView = YZProductImageView()
  private lazy var descriptionView = YZProductDescriptionView()
  private lazy var priceView = YZPProductPriceView()
  private lazy var unitPriceLabel = UILabel.make(with: 13, textColor: .systemGray, textAlignment: .right)

  private lazy var button: UIButton = {
    UIButton.make(
      cornerRadius: YZConstants.buttonHeight / 2.0,
      borderColor: .clear,
      backgroundColor: .systemGreen,
      target: self,
      action: #selector(onTap)
    )
  }()

  // MARK: - Internal property

  weak var delegate: YZProductCellDelegate?
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
  var hasAdded: Bool? {
    didSet {
      guard let hasAdded = hasAdded else { return }
      if hasAdded {
        let image = UIImage(systemName: Constants.plusImageName)?
          .colored(.white)?
          .resized(Constants.buttonImageSize)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemGreen
      } else {
        let image = UIImage(systemName: Constants.minusImageName)?
          .colored(.black)?
          .resized(Constants.buttonImageSize)
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
      }
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

    containerView.addSubview(containerMiddleView)

    // MARK: - Left sub views (image, title, quantity)

    containerView.addSubview(productImageView)
    containerView.addSubview(descriptionView)

    // MARK: - Middle sub views (price, unit price)

    contentView.addSubview(containerView)
    containerMiddleView.addSubview(priceView)
    containerMiddleView.addSubview(unitPriceLabel)

    // MARK: - Round button

    containerView.addSubview(button)

    // MARK: - Mask

    [
      containerView,
      containerMiddleView,
      productImageView,
      descriptionView,
      priceView,
      unitPriceLabel,
      button
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

      button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: YZConstants.smallMargin),
      button.leftAnchor.constraint(equalTo: containerMiddleView.rightAnchor, constant: YZConstants.smallMargin),
      button.rightAnchor.constraint(equalTo: containerView.rightAnchor),
      button.widthAnchor.constraint(equalToConstant: YZConstants.buttonHeight),
      button.heightAnchor.constraint(equalTo: button.widthAnchor)
    ])
  }
}

// MARK: - Action

private extension YZProductCell {
  @objc
  func onTap() {
    delegate?.onTap(model: product)
  }
}
