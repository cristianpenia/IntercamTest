//
//  ShowMapShowMapViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit
import MapKit

class ShowMapViewController: UIViewController {
    
    
    // MARK: Views
    
    @IBOutlet weak var airportsMapView: MKMapView!
    
    
    // MARK: Properties
    
    var output: ShowMapViewOutput!
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        output.viewIsReady()
    }
    
    private func setup() {
        airportsMapView.delegate = self
    }
    
    func customMap(with airports: [Airport]) {
        
        var airportsPoints = [CLLocationCoordinate2D]()
        
        for airport in airports {
            airportsPoints.append(CLLocationCoordinate2D(latitude: airport.latitudeDeg,
                                                         longitude: airport.longitudeDeg))
        }
        
        addAnnotations(airportsPoints)
        zoomToFitAnnotations()
    }
    
    private func addAnnotations(_ coordinates: [CLLocationCoordinate2D]) {
        for coordinate in coordinates {
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            
            airportsMapView.addAnnotation(annotation)
        }
    }
    
    private func zoomToFitAnnotations() {
        var zoomRect = MKMapRect.null
        
        for annotation in airportsMapView.annotations {
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x,
                                      y: annotationPoint.y,
                                      width: 0,
                                      height: 0)
            zoomRect = zoomRect.union(pointRect)
        }
        
        airportsMapView.setVisibleMapRect(zoomRect, 
                                          edgePadding: UIEdgeInsets(top: 100,
                                                                    left: 100,
                                                                    bottom: 100,
                                                                    right: 100),
                                          animated: true)
    }
}


// MARK: ShowMapViewInput

extension ShowMapViewController: ShowMapViewInput {
    
    func setupInitialState(airports: [Airport]) {
        customMap(with: airports)
    }
    
    func modelInput() -> ShowMapModuleInput {
        return output as! ShowMapModuleInput
    }
}


// MARK: MKMapViewDelegate

extension ShowMapViewController: MKMapViewDelegate {
    
}
