//
//  Map.swift
//  CampusNavigator
//
//  Created by Abdul 017 on 2025-06-09.
//
import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Map")
                .font(.system(size: 48, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Map(position: $position) {
   
                Marker("San Francisco", coordinate: .init(latitude: 37.7749, longitude: -122.4194))
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .mapStyle(.standard)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
