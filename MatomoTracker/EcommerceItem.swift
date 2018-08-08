//
//  EcommerceItem.swift
//  MatomoTracker
//
//  Created by Yury Krainik on 8/8/18.
//  Copyright © 2018 Yury Krainik. All rights reserved.
//

import Foundation

public struct EcommerceItem {
	public let sku: String
	public var name: String?
	public var category: String?
	public var price: Double
	public var quantity: Double
	public var formatter: NumberFormatter

	public init(sku: String, price: Double, quantity: Double, formatter: NumberFormatter) {
		self.sku = sku
		self.price = price
		self.quantity = quantity
		self.formatter = formatter
	}

	public func jsonObject() -> Any {

		var dict = ["sku": sku, "quantity": formatter.string(from: quantity as NSNumber), "price": formatter.string(from: price as NSNumber)]

		if let name = name {
			dict["name"] = name
		}

		if let category = category {
			dict["category"] = category
		}

		return dict
	}
}
