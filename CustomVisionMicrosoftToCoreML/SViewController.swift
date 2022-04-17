//
//  SViewController.swift
//  CustomVisionMicrosoftToCoreML
//
//  Created by Pranav Kode on 16/04/22.
//  Copyright © 2022 Assignment. All rights reserved.
//

import UIKit
import MapKit

struct Center {
    var name: String
    var latitude: CLLocationDegrees
    var longtitude: CLLocationDegrees
}

class SViewController: UIViewController {
    @IBOutlet var nameTitle: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    // @IBOutlet var nameLbabel: UILabel! = UILabel()
    //@IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextView!
    @IBOutlet var nameType: UILabel!
    
    func fetchCentersOnMap(_ centers: [Center]) {
        for center in centers {
            let annotations = MKPointAnnotation()
            annotations.title = center.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: center.latitude, longitude: center.longtitude)
            mapView?.addAnnotation(annotations)
        }
    }
    
    var instructions: [String:String] = [
        "bandaid" : "Medical waste can pose a safety hazard and never goes in curbside recycling or waste bins. Dispose of them in a safe container, or contact your local provider.",
        "battery" : "Batteries are hazerdous waste! Look for in-store recycling bins or community collection events to dispose of batteries.",
        "bread" : "The greenest way of disposing of food waste such as bread, composting is the answer. You can turn the food scraps into the garden every couple of days.",
        "bulb" : "Fluorescent Lamps and Tubes are toxic pollutant if broken! Take lamps and tubes to a household hazardous waste collection center or event.",
        "cans" : "Make sure all cans are clear of liquids or foods that could be left in the container. You can do this by rinsing the can when you're finished with it. \n\nAlso, ask your local recycling center to see if you need to remove the paper labels from the can or if it's part of their process.",
        "carton" : "Cardboard pizza delivery boxes without leftovers or liners should be recycled; but leftover crusts, cheese and other food should not.",
        "chopsticks" : "Wooden chopsticks can be disposed of with other green waste. Plastic chopsticks are usually made out of plastic #5 and can be recycled.",
        "diapers" : "These materials will spoil all of the recyclables, turning the load to trash. Trash these instead and keep recyclables clean and dry.",
        "dishes" : "If you can, wrap up the pieces in a cloth and break them down further with a hammer so they won't hurt anyone. Then, dispose of them as broken glass.",
        "facialmask" : "The best way to ensure that disposable masks do not end up on the streets or ocean is to ensure they actually end up in the trash bins and eventually in landfills.",
        "glassbottle" : "Check local program guidelines for options to recycle glass. Some communities have curbside pickup or drop-off locations to recycle glass.",
        "leftovers" : "Add the food waste to cardboard, newspaper, vegetation and other organic materials in your compost pile. Mix it in with soil and dirt so the food can be broken down.",
        "medicinebottle" : "Recycle plastics by shape: bottles, jars, jugs and tubs. Clean and dry containers, then put the cap back on before tossing in the bin.",
        "milkbox"  : "Rules for recycling milk cartons, juice boxes and food cartons vary by city, county and state. Check local recycling programs for options to recycle cartons. Make sure containers are completely empty to avoid contamination.",
        "napkin" : "Dispose, used paper napkins with other food waste. This is because the fibers in a napkin are too short to be made into new paper. Also, they are usually soiled which affects contaminates the recycling process.",
        "newspaper" : "Paper, newspaper and magazines are good to recycle. If paper is soiled or wet, compost it.",
        "nuts" : "Dispose nut shells with other food waste.",
        "pen" : "The easiest way to recycle pens is to send them to TerraCycle's Writing Instrument Brigade. The program is sponsored by pen manufacturers Sharpie and Paper Mate, so you can return all their products through the program. That includes pens and pen caps, highlighters, markers and mechanical pencils.",
        "plasticbag" : "Do not bag recyclables as materials inside may not get recycled. Reuse plastic bags, or learn where you can recycle them at plasticfilmrecycling.org.",
        "plasticbottle" : "Recycle plastics by shape: bottles, jars, jugs and tubs. Clean and dry containers, then put the cap back on before tossing in the bin."
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = instructions[State.instance.textField]
        //print(textField.text)
        let stringToColor = "recycling"
        //print(stringToColor)
        let range = (textField.text as NSString).range(of: stringToColor)
        let mutableAttributedString = NSMutableAttributedString.init(string: textField.text)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        
        nameTitle.text = State.instance.nameTitle
        nameType.text = State.instance.nameType
        if(nameType.text == "Recyclable") {
            nameType.textColor = UIColor.seemuBlue
        }else if (nameType.text == "Residual Waste"){
            nameType.textColor = UIColor.orange
        } else if (nameType.text == "Hazardous Waste"){
            nameType.textColor = UIColor.redRed
        }
        else {
            nameType.textColor = UIColor.seemuBlue
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 38.54173986258999, longitude: -121.75964923082806)
        annotation.title = "You are here :)"
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 500, 500)
        mapView.setRegion(region, animated: true)
        let centers = [Center(name: "Recology Davis", latitude: 38.55587915834572, longtitude: -121.69407482235287),
        Center(name: "Green Zone Recycling Center", latitude: 38.704771567574625, longtitude: -121.75608563754285)]
        fetchCentersOnMap(centers)
    }
}
