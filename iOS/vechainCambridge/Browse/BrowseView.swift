//
//  BrowseView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI
import MapKit

struct BrowseView: View {
    
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var searchText: String = ""
    
    @StateObject var viewModel = ContentViewModel()
    
    private let locations = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 52.20509662161568, longitude: 0.12024457616244591)),
        Location(coordinate: CLLocationCoordinate2D(latitude: 52.2050881395638, longitude: 0.11868004956538353)),
        Location(coordinate: CLLocationCoordinate2D(latitude: 52.204630013113515, longitude: 0.12228586037327177)),
        Location(coordinate: CLLocationCoordinate2D(latitude: 52.20381073794319, longitude: 0.1211828715261582))
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Map(coordinateRegion: $mapRegion, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        Image(systemName: "circle.circle.fill")
                            .foregroundColor(.white.opacity(0.8))
                            .background(.blue)
                            .imageScale(.large)
                            .cornerRadius(50)
                    }
                }

                HStack {
                    VStack(spacing: 4) {
                        HStack {
                            Image(systemName: "location.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                            
                            Text("Newnham, Cambridge")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                            
                            Image(systemName: "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("within 2km")
                                .font(.system(size: 14, weight: .regular, design: .rounded))
                            
                            Spacer()
                        }
                        .padding(.leading, 24)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "slider.horizontal.2.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(.thinMaterial)
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    BrowseView()
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var userCoordinates: String = "--º N, --º W"
    @Published var mapRegion = MKCoordinateRegion()

    override init() {
        super.init()
        checkIfLocationIsEnabled()
    }

    func checkIfLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.delegate = self
            locationManager?.requestWhenInUseAuthorization() // Request authorization
            locationManager?.startUpdatingLocation() // Start updating location
        } else {
            print("Show an alert letting them know this is off")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }

        switch locationManager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            print("Location access not authorized.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            userCoordinates = String(format: "%.4fº N, %.4fº W", latitude, longitude)
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
    
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimum = 0
        return formatter
    }()
}

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
