import UIKit

extension UIImageView {
  /// Make plain UIIMageView
  ///
  ///  - Parameters:
  ///     - imageName: Image name for UIIMage
  static func plain(_ imageName: String) -> UIImageView {
    let imageView = UIImageView(image: UIImage(named: imageName))
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    return imageView
  }
}
