//
//  CountryListCell.swift
//  Countries
//
//  Created by Yiğit Erdinç on 8.01.2022.
//

import UIKit

class CountryListCell: UICollectionViewCell {

	@IBOutlet weak var countryListCellLabel: UILabel!
	@IBOutlet weak var countryListCellButton: UIButton!

	func setupCountryListCell() {
		layer.borderWidth = contentView.frame.height / 25
		layer.cornerRadius = contentView.frame.height / 10
		adaptForUIStyle()
	}

	func adaptForUIStyle() {
		if traitCollection.userInterfaceStyle == .light {
			layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1.0)
		} else {
			layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
		}
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		setupCountryListCell()
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		adaptForUIStyle()
	}

	func configureCell(with viewModel: String) {
		countryListCellLabel.text = ""
	}

	@IBAction func countryListCellButtonPressed(_ sender: UIButton) {
		countryListCellButton.setBackgroundImage(UIImage(systemName: "star.fill"), for: .normal)
	}
}
