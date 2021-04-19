//
//  CompassHeading.swift
//  RamdanPro
//
//  Created by Apple on 10/04/2021.
//


import Foundation
import Combine
import CoreLocation
import SwiftUI

class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @ObservedObject var qdirection = qiblaFinder()
    
    var offset : Double {
        didSet {
            qdirection.getLocation()
        }
    }
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = .zero {
        didSet {
           
            objectWillChange.send()
        }
    }
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        self.offset = 256.9
        super.init()
        self.locationManager.delegate = self
        self.setup()
    }
    
    private func setup() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.degrees = -1 * newHeading.magneticHeading.advanced(by: -offset)

    }
}

