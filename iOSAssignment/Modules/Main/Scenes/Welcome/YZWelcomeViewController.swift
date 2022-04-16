import UIKit

final class YZWelcomeViewController: UIViewController, YZPresenterProtocol, YZWelcomeOutputProtocol {
  // MARK: - Constants

  private enum Constants {
    static let welcomeImageName = "welcome"
    static let welcomeText = NSLocalizedString("WelcomeKey", comment: "")
    static let buttonHeight: CGFloat = 44
    static let buttonInsets: UIEdgeInsets = .init(top: 5, left: 12, bottom: 5, right: 12)
    static let imageSize: CGSize = .init(width: 184, height: 184)
  }

  // MARK: - Private property

  private lazy var welcomeImageView = UIImageView.plain(Constants.welcomeImageName)

  private lazy var welcomeButton: UIButton = {
    let button = UIButton.make(
      cornerRadius: Constants.buttonHeight / 2,
      title: Constants.welcomeText,
      borderColor: .black,
      borderWidth: 1,
      backgroundColor: .white,
      highlightedColor: .systemYellow,
      target: self,
      action: #selector(onWelcome)
    )
    button.setTitleColor(.black, for: .normal)
    button.contentEdgeInsets = Constants.buttonInsets
    return button
  }()

  // MARK: - Internal property

  var onFinish: (() -> Void)?
  
  // MARK: - Life circle

  override func viewDidLoad() {
    super.viewDidLoad()
    createUI()
  }

  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      navigationController?.setNavigationBarHidden(false, animated: animated)
  }
}

// MARK: - Private

private extension YZWelcomeViewController {
  func createUI() {
    title = ""
    view.backgroundColor = .systemBackground

    let containerView = UIView()

    view.addSubview(containerView)
    containerView.addSubview(welcomeImageView)
    containerView.addSubview(welcomeButton)

    [containerView, welcomeImageView, welcomeButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    NSLayoutConstraint.activate([
      containerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      containerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),

      welcomeImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
      welcomeImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      welcomeImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
      welcomeImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
      welcomeImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),

      welcomeButton.topAnchor.constraint(equalTo: welcomeImageView.bottomAnchor),
      welcomeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      welcomeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      welcomeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
    ])
  }
}

// MARK: - Action

private extension YZWelcomeViewController {
  @objc
  func onWelcome() {
    onFinish?()
  }
}
