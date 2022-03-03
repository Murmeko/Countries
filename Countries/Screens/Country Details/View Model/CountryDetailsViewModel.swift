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
	private var countryCapital = ""

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
				self.fetchFurtherCountryDetails()
			}
		}
	}

	func fetchFurtherCountryDetails() {
		networkManager.fetchFurtherCountryDetails(countryCode: self.countryCode) { countryDetailsSecondModel in
			if let countryDetailsSecondModel = countryDetailsSecondModel {
				self.countryCapital = countryDetailsSecondModel.capital
				self.reloadView?()
			}
		}
	}

	func getCountryDetails() -> CountryDetailsData {
		return self.country
	}

	func getFurtherCountryDetails() -> String {
		return self.countryCapital
	}
}
