import Foundation

public enum YZURLError: Error {
  case noConnection
  case timedOut
  case forbidden
  case unspecified(statusMessage: String)
}

public extension Int {
  func urlError() -> YZURLError {
    switch self {
    case URLError.notConnectedToInternet.rawValue:
      return .noConnection

    case URLError.timedOut.rawValue, 408, 504:
      return .timedOut

    case 403:
      return .forbidden

    default:
      return .unspecified(statusMessage: "Error")
    }
  }
}

