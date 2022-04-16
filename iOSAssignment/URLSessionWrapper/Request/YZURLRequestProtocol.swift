import Foundation

public protocol YZURLRequestProtocol {
  /// URL path for request data
  var url: URL { get }

  /// HTTP method (POST, GET, PUT etc)
  var httpMethod: YZURLRequestType { get }
}
