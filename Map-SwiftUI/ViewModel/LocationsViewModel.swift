//
//  LocationsViewModel.swift
//  Map-SwiftUI
//
//  Created by Omar AbdElrazek on 01/01/2024.
//

import Foundation
import SwiftUI
import MapKit
class LocationsViewModel: ObservableObject{
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
//    @Published var mapRegion = MapCameraPosition.region(MKCoordinateRegion())
    @Published var mapRegion = MKCoordinateRegion()
    @Published var isShowingLocationList = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        updateMapRegion(location: mapLocation)
    }
    
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//            mapRegion = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates,
//                                           span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        }
    }
    
    func showNextLocation(location: Location){
        mapLocation = location
        isShowingLocationList = false
    }
    
    func nextButtonPressed(){
        // what is the current location's index
        // check if is valid
        //if true add one to current location's index
        //if false show the first location in the array
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation})else{
            print("Could not find the current location's index")
            return
        }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else{
            showNextLocation(location: locations.first!)
            return
        }
        
        showNextLocation(location: locations[nextIndex])
    }
    
}
