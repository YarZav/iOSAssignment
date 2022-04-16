import UIKit

final class YZProductImageView: UIView {
  // MARK: - Constants

  private enum Constants {
    static let imageSize: CGSize = .init(width: 100, height: 100)
    static let emptyImageName = "empty"
  }

  // MARK: - Private property

  private let imageManager: YZImageManagerProtocol = YZImageManager()

  private lazy var activityIndicatorView = UIActivityIndicatorView(style: .medium)
  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemGray6
    imageView.layer.cornerRadius = Constants.imageSize.width / 15
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
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
    addSubview(activityIndicatorView)

    productImageView.translatesAutoresizingMaskIntoConstraints = false
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: topAnchor),
      productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      productImageView.leftAnchor.constraint(equalTo: leftAnchor),
      productImageView.rightAnchor.constraint(equalTo: rightAnchor),
      productImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
      productImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),

      activityIndicatorView.topAnchor.constraint(equalTo: topAnchor),
      activityIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
      activityIndicatorView.leftAnchor.constraint(equalTo: leftAnchor),
      activityIndicatorView.rightAnchor.constraint(equalTo: rightAnchor)
    ])
  }

  func loadReceiveCompeltion(_ completion: Result<Data?, YZURLError>) {
    activityIndicatorView.stopAnimating()
    switch completion {
    case .success(let data):
      guard let data = data else { return }
      productImageView.image = UIImage(data: data)
    case .failure:
      productImageView.image = UIImage(named: Constants.emptyImageName)
    }
  }
}

// MARK: - Internal

extension YZProductImageView {
  func load(with url: URL?) {
    guard let url = url else { return }
    activityIndicatorView.startAnimating()
    imageManager.loadImage(
      with: url,
      complation: { [weak self] result in
        DispatchQueue.main.async { self?.loadReceiveCompeltion(result) } }
    )
  }
}

