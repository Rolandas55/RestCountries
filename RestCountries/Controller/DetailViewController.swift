//
//  DetailViewController.swift
//  RestCountries
//
//  Created by kraujalis.rolandas on 16/11/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var flag = ""
    var country = ""
    var region = ""
    var borders = ""
    var capital = ""
    var population = ""
    var languages = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar() {
        title = country
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        setupNavigationBar()
    
        let flagLabel = UILabel()
        let detailStack = UIStackView()
        let regionLabel = UILabel()
        let borderLabel = UILabel()
        let capitalLabel = UILabel()
        let populationLabel = UILabel()
        let languagesLabel = UILabel()
        
        detailStack.axis = .vertical
        detailStack.distribution = .fillProportionally
        detailStack.alignment = .leading
        detailStack.spacing = 5
        detailStack.backgroundColor = UIColor.gray
        detailStack.layer.cornerRadius = 10
        
        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        detailStack.translatesAutoresizingMaskIntoConstraints = false
        
        let labels = [regionLabel, capitalLabel, borderLabel, populationLabel, languagesLabel]
        for label in labels {
            label.textColor = UIColor.white
            label.textAlignment = .left
            label.numberOfLines = 0
            detailStack.addArrangedSubview(label)
            label.font.withSize(14)
            label.backgroundColor = UIColor.darkGray
            label.widthAnchor.constraint(equalTo: detailStack.widthAnchor).isActive = true
        }
        
        view.addSubview(flagLabel)
        view.addSubview(detailStack)
        
        detailStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        detailStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        detailStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        detailStack.bottomAnchor.constraint(greaterThanOrEqualTo: flagLabel.topAnchor, constant: -30).isActive = true

        flagLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        flagLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        flagLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    
        flagLabel.textAlignment = .center
        flagLabel.font = flagLabel.font.withSize(200)
        flagLabel.text = flag
        
        borderLabel.numberOfLines = 0
        
        regionLabel.text = "\tRegion: \(region)"
        borderLabel.text = "\tBorders: \(borders)"
        capitalLabel.text = "\tCapital: \(capital)"
        if let population = Int(population) {
            populationLabel.text = "\tPopulation: \(population.formatted())"
        } else {
            populationLabel.text = "\tPopulation: "
        }
        languagesLabel.text = "\tLanguages: \(languages)"
        
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
