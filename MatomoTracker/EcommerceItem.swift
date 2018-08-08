//
//  EcommerceItem.swift
//  MatomoTracker
//
//  Created by Yury Krainik on 8/8/18.
//  Copyright © 2018 Yury Krainik. All rights reserved.
//

import Foundation

public struct EcommerceItem {
	let sku: String
	let name: String?
	let category: String?
	let price: Double
	let quantity: Double
	let formatter: NumberFormatter

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
