//
//  SavedCountriesListViewController.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class SavedCountriesListViewController: UICollectionViewController {

	private var savedCountriesListRefreshControl = UIRefreshControl()

	@IBOutlet var savedCountriesListCollectionView: UICollectionView!

	private var selectedCountry = CountryListData.placeholder

	func setupCountryListCollectionView() {
		savedCountriesListCollectionView.register(UINib(nibName: "CountryListCell", bundle: nil),
																							forCellWithReuseIdentifier: "ReuseableCountryListCell")
		savedCountriesListCollectionView.register(UINib(nibName: "LoadingCollectionViewCell", bundle: nil),
																							forCellWithReuseIdentifier: "ReuseableLoadingCollectionViewCell")
		savedCountriesListCollectionView.delegate = self
		savedCountriesListCollectionView.dataSource = self

		savedCountriesListCollectionView.refreshControl = savedCountriesListRefreshControl
		savedCountriesListRefreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

		if let layout = savedCountriesListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.minimumLineSpacing = 20
			layout.minimumInteritemSpacing = 20
			layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 25, right: 25)

			let cellWidth = collectionView!.bounds.width - 50
			let cellHeight = cellWidth / 5

			let size = CGSize(width: cellWidth, height: cellHeight)

			layout.itemSize = size

		}
		savedCountriesListCollectionView.isUserInteractionEnabled = false
	}

	@objc private func refreshData(_ sender: Any) {
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	 // MARK: - Navigation

	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using [segue destinationViewController].
	 // Pass the selected object to the new view controller.
	 }

	// MARK: UICollectionViewDataSource

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of items
		return 0
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableCountryListCell", for: indexPath)
		return cell
	}

	// MARK: UICollectionViewDelegate

	/*
	 // Uncomment this method to specify if the specified item should be highlighted during tracking
	 override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
	 return true
	 }
	 */

	/*
	 // Uncomment this method to specify if the specified item should be selected
	 override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
	 return true
	 }
	 */

	/*
	 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
	 override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
	 return false
	 }

	 override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
	 return false
	 }

	 override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

	 }
	 */

}
