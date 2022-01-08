//
//  CountryListModel.swift
//  Countries
//
//  Created by Yiğit Erdinç on 8.01.2022.
//

import Foundation

// MARK: - CountryListModel
struct CountryListModel: Codable {
	let data: [Datum]
	let metadata: Metadata
}

// MARK: - Datum
struct Datum: Codable {
	let code: String
	let currencyCodes: [String]
	let name, wikiDataID: String

	enum CodingKeys: String, CodingKey {
		case code, currencyCodes, name
		case wikiDataID = "wikiDataId"
	}
}

// MARK: - Metadata
struct Metadata: Codable {
	let currentOffset, totalCount: Int
}
