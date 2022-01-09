//
//  CountryListViewController.swift
//  Countries
//
//  Created by Yiğit Erdinç on 8.01.2022.
//

import UIKit

class CountryListViewController: UICollectionViewController {

	private var countryListRefreshControl = UIRefreshControl()

	@IBOutlet var countryListCollectionView: UICollectionView!

	private var countryListViewModel = CountryListViewModel()

	private var selectedCountry = CountryListData.placeholder

	func setupCountryListCollectionView() {
		countryListCollectionView.register(UINib(nibName: "CountryListCell", bundle: nil),
																			 forCellWithReuseIdentifier: "ReuseableCountryListCell")
		countryListCollectionView.register(UINib(nibName: "LoadingCollectionViewCell", bundle: nil),
																			 forCellWithReuseIdentifier: "ReuseableLoadingCollectionViewCell")
		countryListCollectionView.delegate = self
		countryListCollectionView.dataSource = self

		countryListCollectionView.refreshControl = countryListRefreshControl
		countryListRefreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

		if let layout = countryListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.minimumLineSpacing = 20
			layout.minimumInteritemSpacing = 20
			layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 25, right: 25)

			let cellWidth = collectionView!.bounds.width - 50
			let cellHeight = cellWidth / 5

			let size = CGSize(width: cellWidth, height: cellHeight)

			layout.itemSize = size

		}
		countryListCollectionView.isUserInteractionEnabled = false
	}

	@objc private func refreshData(_ sender: Any) {
		countryListViewModel.refreshCountries()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupCountryListCollectionView()
		countryListViewModel.reloadCollectionView = {
			self.countryListCollectionView.reloadData()
			self.countryListRefreshControl.endRefreshing()
			self.countryListCollectionView.isUserInteractionEnabled = true
		}
		countryListViewModel.fetchCountries()
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

	}

	// MARK: UICollectionViewDataSource

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return countryListViewModel.getCountryCount() + 1
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.row == countryListViewModel.getCountryCount() {
			let cell = countryListCollectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableLoadingCollectionViewCell", for: indexPath) as? LoadingCollectionViewCell
			cell?.loadingCellActivityIndicator.startAnimating()
			return cell!
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableCountryListCell", for: indexPath) as? CountryListCell
			let country = countryListViewModel.getCountry(for: indexPath)
			cell?.countryListCellLabel.text = country.name
			return cell!
		}
	}

	override func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let position = scrollView.contentOffset.y
		if position > countryListCollectionView.contentSize.height - 5 - scrollView.frame.size.height {
			countryListViewModel.fetchCountries()
		}
	}

	// MARK: UICollectionViewDelegate

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if indexPath.row != countryListViewModel.getCountryCount() {
			self.selectedCountry = countryListViewModel.getCountry(for: indexPath)
			debugPrint("Ubele")
		}
	}
}
