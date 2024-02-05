//
//  MapViewModel.swift
//  Pawbook
//
//  Created by Ege Çam on 5.02.2024.
//

import CoreLocation
import _MapKit_SwiftUI

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                               span: MapDetails.defaultSpan)
    
    @Published var userLocation = CLLocationCoordinate2D(latitude: 41, longitude: 28.97)
    
    @Published var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion.init(center: MapDetails.startingLocation,
                                                                                       latitudinalMeters: 1000,
                                                                                       longitudinalMeters: 1000))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            self.locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager!.delegate = self
        } else {
            print("Show an alert letting them know this is off!")
        }
        
    }
    
    
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            let coordinate = locationManager.location!.coordinate
            userLocation = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            region = MKCoordinateRegion(center: coordinate,
                                        span: MapDetails.defaultSpan)
            cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: userLocation, 
                                                                         latitudinalMeters: 1000,
                                                                         longitudinalMeters: 1000))
            
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
