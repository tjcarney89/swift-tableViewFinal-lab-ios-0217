//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    var planetCellIdentifier: String = "PlanetCell"
    var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    func generatePlanetInfo() {
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not name after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."])
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."])
        let mercury = Planet(name: "Mercury", numberOfMoons: 0, fullOrbit: 88.0, facts: ["Mercury is the smallest planet.", "Mercury does not have any moons or rings.", "Despite being closest to the sun, Mercury is only the second hottest planet."])
        let venus = Planet(name: "Venus", numberOfMoons: 0, fullOrbit: 225.0, facts: ["Venus rotates the opposite direction fo most planets.", "Venus is the hottest planet in the solar system.", "Venus is also called Earth's sister planet."])
        let jupiter = Planet(name: "Jupiter", numberOfMoons: 67, fullOrbit: 4333.0, facts: ["Jupiter has the shortest day of any planet in the solar system.", "The Great Red Dot is a huge storm on Jupiter.", "Eight spacecraft have visited Jupiter."])
        let saturn = Planet(name: "Saturn", numberOfMoons: 62, fullOrbit: 10756.0, facts: ["Saturn is the flattest planet.", "Saturn is made mostly of hydrogen.", "Saturn can be seen from Earth with the naked eye."])
        let uranus = Planet(name: "Uranus", numberOfMoons: 27, fullOrbit: 30687, facts: ["Uranus wasn't discovered until 1781.", "Uranus is often called an Ice Giant.", "Uranus has the coldest temperatures of any planet."])
        let neptune = Planet(name: "Neptune", numberOfMoons: 14, fullOrbit: 60190.0, facts: ["Only one spacecraft has even flown by Neptune.", "Neptune is the smallest of the Ice Giants.", "Neptune has a very active climate with storms and high winds."])
        
        planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FactTableViewController, let indexPath = tableView.indexPathForSelectedRow {
            dest.planet = planets[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetTableViewCell
        
        let currentPlanet = planets[indexPath.row]
        cell.planetNameLabel.text = currentPlanet.name
        cell.numberOfMoonsLabel.text = "\(currentPlanet.numberOfMoons) Moons"
        cell.numberOfDaysFullOrbitLabel.text = "\(currentPlanet.fullOrbit) Days"
        cell.numberOfFactsLabel.text = "\(currentPlanet.facts.count) Facts"
        
        
        return cell
        
        
    }
}
