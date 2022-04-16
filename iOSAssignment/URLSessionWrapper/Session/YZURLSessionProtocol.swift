import Foundation

/// Simple wrapper for URL session
public protocol YZURLSessionProtocol {
  /// Data task for reqeust
  ///
  /// - Parameters:
  ///     - request: URL request
  ///     - completion: Compeltion result with error and data
  func dataTask(
    with request: YZURLRequestProtocol,
    completion: ((Result<Data?, YZURLError>) -> Void)?
  )
}
