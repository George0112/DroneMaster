//
//  SpotMapView.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/6/13.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit
import URLImage

struct SpotMapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var annotation: MKPointAnnotation
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.mapType = MKMapType.satellite;
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {

        print("Updating", self.$annotation)
        view.removeAnnotations(view.annotations)
        view.addAnnotation(self.annotation)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: SpotMapView

        init(_ parent: SpotMapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
            print(parent.centerCoordinate)
        }
    }
}
