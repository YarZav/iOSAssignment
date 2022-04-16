//
//  YZProduct.swift
//  iOSAssignment
//
//  Created by 19205313 on 16.04.2022.
//

import Foundation
import UIKit

/// Business model
final class YZProduct {
  // MARK: - Default property

  /// Title of product
  let title: String

  /// Quantity of product
  let quantity: String

  /// Price of product
  let price: Decimal

  /// Price for hole unit
  let unitPriceWithAmount: String

  /// Image url
  let imageUrl: URL?

  // MARK: - Custom property

  /// Count in the cart
  var countInCart: Int = 0

  /// Displayed image
  var image: UIImage?

  // MARK: - Init

  init(
    title: String,
    quantity: String,
    price: Decimal,
    unitPriceWithAmount: String,
    imageUrl: URL?
  ) {
    self.title = title
    self.quantity = quantity
    self.price = price
    self.unitPriceWithAmount = unitPriceWithAmount
    self.imageUrl = imageUrl
  }
}
