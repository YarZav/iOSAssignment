import Foundation

public enum YZURLError: Error {
  case unspecified(statusMessage: String)
}

public extension Int {
  func urlError() -> YZURLError {
    switch self {
    default:
      return .unspecified(statusMessage: "Error")
    }
  }
}

