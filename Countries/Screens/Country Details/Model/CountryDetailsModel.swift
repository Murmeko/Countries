//
//  CountryDetailsModel.swift
//  Countries
//
//  Created by Yiğit Erdinç on 8.01.2022.
//

import Foundation

// MARK: - CountryDeatilsModel
struct CountryDetailsModel: Codable {
	let data: CountryDetailsData
}

// MARK: - DataClass
struct CountryDetailsData: Codable {
	let capital, code, callingCode: String
	let currencyCodes: [String]
	let flagImageURI: String
	let name: String
	let numRegions: Int
	let wikiDataID: String

	enum CodingKeys: String, CodingKey {
		case capital, code, callingCode, currencyCodes
		case flagImageURI = "flagImageUri"
		case name, numRegions
		case wikiDataID = "wikiDataId"
	}
}

extension CountryDetailsData {
	static var placeholder = {
		return CountryDetailsData(capital: "", code: "", callingCode: "", currencyCodes: [""], flagImageURI: "", name: "", numRegions: 0, wikiDataID: "")
	}
}
