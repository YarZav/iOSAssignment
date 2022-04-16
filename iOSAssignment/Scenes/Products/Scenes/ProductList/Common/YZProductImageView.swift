import UIKit

final class YZProductImageView: UIView {
  // MARK: - Constants

  private enum Constants {
    static let imageSize: CGSize = .init(width: 100, height: 100)
  }

  // MARK: - Private property

  private let imageManager: YZImageManagerProtocol = YZImageManager()

  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .darkGray
    return imageView
  }()

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    createUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private

private extension YZProductImageView {
  func createUI() {
    addSubview(productImageView)

    productImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: topAnchor),
      productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      productImageView.leftAnchor.constraint(equalTo: leftAnchor),
      productImageView.rightAnchor.constraint(equalTo: rightAnchor),
      productImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
      productImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
    ])
  }

  func loadReceiveCompeltion(_ completion: Result<Data?, YZURLError>) {
    switch completion {
    case .success(let data):
      guard let data = data else { return }
      productImageView.image = UIImage(data: data)
    case .failure:
      break
    }
  }
}

// MARK: - Internal

extension YZProductImageView {
  func load(with url: URL?) {
    guard let url = url else { return }
    imageManager.loadImage(
      with: url,
      complation: { [weak self] in self?.loadReceiveCompeltion($0) }
    )
  }
}

