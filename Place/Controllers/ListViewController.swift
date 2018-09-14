//
//  ListViewController.swift
//  Place
//
//  Created by AlexanderKogut on 9/13/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import UIKit
import CoreLocation

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sorteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sorteButton.tintColor = UIColor.white
        self.title = "Ближайшие ТЦ"
        
    }
    
    @IBAction func sortedPlace(_ sender: Any) {
        
        print("sortedPlace button")
        locationSorted()
        self.title = "Рядом с Вами"
    }
    
    func showOrHideBarButton(show: Bool)  {
        
        if show {
            self.navigationItem.rightBarButtonItem = sorteButton
            
        } else {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    func locationSorted() {
        
        print("User Location \(LocationDistanceService.userLocation)")
        let placeObjc = PlacesObject.places
        
        //Places Location
        var placesLocationDict = [CLLocation]()
        
        //Places Distance
        var distanceFromUser: [Double: PlaceModel] = [:]
        
        //Get all Places Location
        for i in placeObjc {
            let location = LocationDistanceService.placeLocation(lat: i.lat, long: i.long)
            placesLocationDict.append(location)
        }
    
        for (dict, obj) in zip(placesLocationDict, placeObjc) {
            
                //Get location Distance from userLocation to Place and make Dictianary [distanse: Object]
                let distance = LocationDistanceService.userLocation.distance(from: dict)
                distanceFromUser[distance] = obj
            }
        
        //Sorted Distance
        let sortedLocation = distanceFromUser.map({$0.key}).sorted(by: {$0 < $1})
        
        //Sorted Distance
        var finalLocation:[PlaceModel] = []
        
        //Add Place Object im correct order for TableView
        for place in sortedLocation {
            print(place)
            finalLocation.append(distanceFromUser[place]!)
        }
        
        print(finalLocation)
        updatePlaces(objects: finalLocation)
    }
}

//MARK: - Sorted Metods
extension ListViewController {
    
    // Remove old order Places and set new order Places
    private func updatePlaces(objects: [PlaceModel]) {
        
        PlacesObject.places.removeAll()
        PlacesObject.places = objects
        tableView.reloadData()
        showOrHideBarButton(show: false)
        animationTable()
        
    }
    
    private func animationTable() {
        
        UIView.animate(withDuration: 0.2) {
            self.tableView.alpha = 0
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.tableView.alpha = 1
        }, completion: nil)
    }
}

extension ListViewController: UITableViewDataSource ,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlacesObject.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        let cellTitel = PlacesObject.places[indexPath.row]
        
        cell.placeTItel.text = cellTitel.titel
        cell.placeSubTitel.text = cellTitel.detailTitel
        ImageService.loadAndShowPicture(imageCell: cell.placeImage, image: cellTitel.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListTableViewCell.heightCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let coorinatePlace = PlacesObject.places[indexPath.row]
        alert(titel: "Проложить маршрут на карте?", coordinate: coorinatePlace)
    }
}

extension ListViewController {
    
    func alert(titel: String, coordinate:PlaceModel) {
        
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        //Changing Alert font of title and message.
        let titleFont = [kCTFontAttributeName: UIFont(name: "Arial", size: 18)!]
        let titleAttrString = NSMutableAttributedString(string: titel, attributes: titleFont as [NSAttributedStringKey : Any])
        
        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        
        let okAction = UIAlertAction(title: "Хочу сюда", style: .default) { (action) in
            
            // Present Map and get directions to  current place
            UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(coordinate.lat),\(coordinate.long)")!, options: [:], completionHandler: nil)
        }
        
        let noAction = UIAlertAction(title: "Нет, я передумал", style: .cancel) { (action) in
            
        }
        
        alertController.addAction(okAction)
        alertController.addAction(noAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
