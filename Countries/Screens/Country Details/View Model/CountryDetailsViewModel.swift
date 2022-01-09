//
//  CountryDetailsViewModel.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Foundation

class CountryDetailsViewModel {

	private var networkManager = NetworkManager()

	private var country = CountryDetailsData.placeholder()
	private var countryCode: String

	var reloadView: (() -> Void)?

	init(with countryCode: String) {
		self.countryCode = countryCode
	}
}

extension CountryDetailsViewModel {
	func fetchCountryDetails() {
		networkManager.fetchCountryDetails(countryCode: self.countryCode) { countryDetailsModel in
			if let countryDetailsModel = countryDetailsModel {
				self.country = countryDetailsModel.data
				self.reloadView?()
			}
		}
	}

	func getCountryDetails() -> CountryDetailsData {
		return self.country
	}
}
