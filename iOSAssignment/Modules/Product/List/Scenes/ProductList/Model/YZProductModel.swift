//
//  YZProduct.swift
//  iOSAssignment
//
//  Created by 19205313 on 16.04.2022.
//

import Foundation
import UIKit

/// Business model
final class YZProductModel {
  // MARK: - Default property

  /// Title of product
  let title: String

  /// Quantity of product
  let quantity: String

  /// Price of product
  let price: Double

  /// Price for hole unit
  let unitPriceWithAmount: String

  /// Image url
  let imageUrl: URL?

  // MARK: - Custom property

  /// Unique identifier for model
  let id: String

  /// Count in the cart
  var countInCart: Int16

  /// Displayed image
  var image: UIImage?

  // MARK: - Init

  init(
    id: String,
    title: String,
    quantity: String,
    price: Double,
    unitPriceWithAmount: String,
    imageUrl: URL?,
    countInCart: Int16 = 0
  ) {
    self.id = id
    self.title = title
    self.quantity = quantity
    self.price = price
    self.unitPriceWithAmount = unitPriceWithAmount
    self.imageUrl = imageUrl
    self.countInCart = countInCart
  }
}
