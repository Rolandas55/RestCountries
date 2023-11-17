//
//  ViewController.swift
//  RestCountries
//
//  Created by kraujalis.rolandas on 15/11/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellID = "cell"
    private let countryAllUrl = "https://restcountries.com/v3.1/all"
    private var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
        
        NetworkManager.fetchData(url: countryAllUrl) {
            countries in
            self.countries = countries
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigationBar()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        view.addGestureRecognizer(longPressRecognizer)
    }
    
    private func setupNavigationBar() {
        title = "Countries"
        let titleImage = UIImage(systemName: "mappin.and.ellipse")
        let imageView = UIImageView(image: titleImage)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .label
    }
    
    @objc func longPress(sender: UILongPressGestureRecognizer) {
        let detailViewController = DetailViewController()
        if sender.state == UIGestureRecognizer.State.began {
            let touchPath = sender.location(in: tableView)
            navigationController?.pushViewController(detailViewController, animated: true)
            if let indexPath = tableView.indexPathForRow(at: touchPath) {
                detailViewController.flag = countries[indexPath.row].flag ?? ""
                detailViewController.country = countries[indexPath.row].name.common ?? ""
                detailViewController.region = countries[indexPath.row].region ?? ""
                detailViewController.borders = countries[indexPath.row].borders?.joined(separator: ", ") ?? ""
                detailViewController.capital = countries[indexPath.row].capital?.joined(separator: ", ") ?? ""
                if let num = countries[indexPath.row].population {
                    detailViewController.population = String(num)
                } else {
                    detailViewController.population = ""
                }
                if let languages = countries[indexPath.row].languages {
                    for (i, val) in languages.enumerated() {
                        detailViewController.languages.append(val.value)
                        if i != languages.count - 1 {
                            detailViewController.languages.append(", ")
                        }
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name.common
        cell.detailTextLabel?.text = country.name.official
        
        return cell
    }
}

