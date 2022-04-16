import UIKit

final class YZPProductPriceView: UIView {
  // MARK: - Private property

  private lazy var priceIntegerLabel = UILabel.make(with: 19, isBold: true, textAlignment: .right)
  private lazy var priceFractionalLabel = UILabel.make(with: 13, isBold: true, textAlignment: .right)

  // MARK: - Internal

  var price: Decimal? {
    didSet {
      guard let price = price else { return }
      priceIntegerLabel.text = "\(NSDecimalNumber(decimal: price).intValue)"
      let intValue = modf(NSDecimalNumber(decimal: price).doubleValue).1 * 100.0
      priceFractionalLabel.text = String(format: "%02d", intValue)
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

private extension YZPProductPriceView {
  func createUI() {
    addSubview(priceIntegerLabel)
    addSubview(priceFractionalLabel)

    priceIntegerLabel.translatesAutoresizingMaskIntoConstraints = false
    priceFractionalLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      priceIntegerLabel.topAnchor.constraint(equalTo: topAnchor),
      priceIntegerLabel.leftAnchor.constraint(equalTo: leftAnchor),
      priceIntegerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

      priceFractionalLabel.topAnchor.constraint(equalTo: topAnchor),
      priceFractionalLabel.leftAnchor.constraint(equalTo: priceIntegerLabel.rightAnchor),
      priceFractionalLabel.rightAnchor.constraint(equalTo: rightAnchor),
      priceFractionalLabel.rightAnchor.constraint(equalTo: rightAnchor)
    ])
  }
}
