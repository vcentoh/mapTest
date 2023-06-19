//
//  MapViewRepresntable.swift
//  RidderyMap
//
//  Created by Magik on 17/6/23.
//

import Foundation
import SwiftUI
import MapKit
import GoogleMaps

struct MapViewRepresentable:  UIViewRepresentable {
    
    typealias UIViewType = GMSMapView
    
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: 10.50, longitude: -66.88, zoom: 15)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewRepresentable
        
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
    }
}
