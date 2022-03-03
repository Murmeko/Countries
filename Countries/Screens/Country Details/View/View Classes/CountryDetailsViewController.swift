//
//  CountryDetailsViewController.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Kingfisher

class CountryDetailsViewController: UIViewController {
	@IBOutlet weak var countryDetailsImageView: UIImageView!
	@IBOutlet weak var countryDetailsLabel: UILabel!
	@IBOutlet weak var countryDetailsCapitalLabel: UILabel!
	@IBOutlet weak var countryDetailsLocaleLabel: UILabel!
	
	private var country = CountryDetailsData.placeholder()

	var countryDetailsViewModel: CountryDetailsViewModel?

	func setupCountryDetailView() {
		countryDetailsViewModel!.fetchCountryDetails()
		countryDetailsViewModel?.reloadView = {
			self.country = self.countryDetailsViewModel!.getCountryDetails()
			let countryImageResource = ImageResource(downloadURL: URL(string: self.country.flagImageURI)!)
			self.countryDetailsImageView.kf.setImage(with: countryImageResource, options: [.processor(SVGImageProcessor())])
			self.countryDetailsLabel.text = "Country Code: \(self.country.code)"
			self.countryDetailsCapitalLabel.text = "Capital: \()"
			self.navigationItem.title = self.country.name
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupCountryDetailView()
	}

	@IBAction func countryDetailsButton(_ sender: UIButton) {
		self.country = self.countryDetailsViewModel!.getCountryDetails()
		if let linkUrl = URL(string: "https://www.wikidata.org/wiki/\(self.country.wikiDataID)") {
				UIApplication.shared.open(linkUrl)
		}
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using segue.destination.
	 // Pass the selected object to the new view controller.
	 }
	 */

}
