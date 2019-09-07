//
//  EateryDetailViewController.swift
//  course 2 main proj
//
//  Created by Daria on 06/08/2019.
//  Copyright © 2019 D.Misch. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rateButton: UIButton!
    var restaurant: Restaurant?
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let svc = segue.source as? RateViewController else { return }
        guard let rating = svc.restRating else { return }
        rateButton.setImage(UIImage(named: rating), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension
        
        imageView.image = UIImage(data: restaurant!.image! as Data)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = restaurant!.name
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restaurant!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restaurant!.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = restaurant!.location
        case 3:
            cell.keyLabel.text = "Я там был?"
            cell.valueLabel.text = restaurant!.isVisited ? "Да" : "Нет"
        default:
            break
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue" {
            let dvc = segue.destination as! MapViewController
            dvc.restaurant = self.restaurant
            
        }
    }
    
    
    
    
    
    
}
