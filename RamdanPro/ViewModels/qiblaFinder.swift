//
//  File.swift
//  RamdanPro
//
//  Created by Apple on 10/04/2021.
//

import Foundation

class qiblaFinder : ObservableObject {
    
    @Published var direction : QiblaDirection!
    
    @Published var degrees : Double?
    
    init() {
        self.direction = QiblaDirection()
        
    }
    
    func setLocation(directions: Double){
        
        self.degrees = directions
        self.direction.degreeNorth = directions
    }
    
    func getLocation()->Double?{
        
        return direction.degreeNorth
    }
    
}
