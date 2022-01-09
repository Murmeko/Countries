//
//  CountryListModel.swift
//  Countries
//
//  Created by Yiğit Erdinç on 8.01.2022.
//

import Foundation

// MARK: - CountryListModel
struct CountryListModel: Codable {
	let data: [CountryListData]
	let metadata: CountryListMetadata
}

// MARK: - Datum
struct CountryListData: Codable {
	let code: String
	let currencyCodes: [String]
	let name, wikiDataID: String

	enum CodingKeys: String, CodingKey {
		case code, currencyCodes, name
		case wikiDataID = "wikiDataId"
	}
}

// MARK: - Metadata
struct CountryListMetadata: Codable {
	let currentOffset, totalCount: Int
}

extension CountryListData {
	static var placeholder: CountryListData {
		return CountryListData(code: "", currencyCodes: [""], name: "", wikiDataID: "")
	}
}
