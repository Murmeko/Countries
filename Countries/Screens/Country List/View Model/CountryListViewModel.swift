//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Foundation

class CountryListViewModel {

	private var networkManager = NetworkManager()

	private var countryList: [CountryListData] = []
	private var isFetchingData = false
	private var pageIndex = 0

	var reloadCollectionView: (() -> Void)?

}

extension CountryListViewModel {

	func fetchCountries() {
		if isFetchingData { return } else {
			isFetchingData = true
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
				guard let self = self else { return }
				self.networkManager.fetchCountryList(pageIndex: self.pageIndex) { countryListModel in
					self.isFetchingData = false
					if let countryListModel = countryListModel {
						self.countryList.append(contentsOf: countryListModel.data)
						for country in countryListModel.data {
							debugPrint(country.name)
						}
						self.pageIndex += 1
						self.reloadCollectionView?()
					}
				}
			}
		}
	}

	func refreshCountries() {
		if isFetchingData {
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
				guard let self = self else { return }
				self.reloadCollectionView?()
			}
		} else {
			isFetchingData = true
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
				guard let self = self else { return }
				self.pageIndex = 0
				self.networkManager.fetchCountryList(pageIndex: self.pageIndex) { countryListModel in
					self.isFetchingData = false
					if let countryListModel = countryListModel {
						self.countryList = countryListModel.data
						for country in countryListModel.data {
							debugPrint(country.name)
						}
						self.pageIndex += 1
						self.reloadCollectionView?()
					}
				}
			}
		}
	}

	func getCountryCount() -> Int {
		return countryList.count
	}

	func getCountry(for indexPath: IndexPath) -> CountryListData {
		return countryList[indexPath.row]
	}
}
