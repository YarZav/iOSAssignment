import UIKit

extension UIImage {
  /// Change tint color for image
  ///
  /// - Parameters:
  ///   - color: Color for redraw
  func colored(_ color: UIColor) -> UIImage? {
    guard let maskImage = cgImage else { return nil }

    let width = size.width
    let height = size.height
    let bounds = CGRect(x: 0, y: 0, width: width, height: height)
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)

    guard let context = CGContext(
      data: nil,
      width: Int(width),
      height: Int(height),
      bitsPerComponent: 8,
      bytesPerRow: 0,
      space: colorSpace,
      bitmapInfo: bitmapInfo.rawValue
    ) else { return nil }

    context.clip(to: bounds, mask: maskImage)
    context.setFillColor(color.cgColor)
    context.fill(bounds)

    if let cgImage = context.makeImage() {
      return UIImage(cgImage: cgImage)
    } else {
      return nil
    }
  }
}
