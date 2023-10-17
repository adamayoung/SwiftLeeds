import MapKit
import SwiftLeedsKit
import SwiftUI

public struct PointsOfInterestMapView: View {

    @Environment(SwiftLeedsStore.self) private var store
    @State private var selectedPointOfInterest: PointOfInterest?

    private var venue: Venue? {
        store.pointsOfInterest.venue
    }

    private var pointsOfInterestGroups: [PointsOfInterestGroup] {
        store.pointsOfInterest.all
    }

    private var initialPosition: MapCameraPosition {
        venue?.mapCameraPosition ?? .automatic
    }

    public init() { }

    public var body: some View {
        Map(initialPosition: initialPosition, selection: $selectedPointOfInterest) {
            ForEach(pointsOfInterestGroups) { group in
                ForEach(group.pointsOfInterest) { pointOfInterest in
                    pointOfInterest.marker
                        .tag(pointOfInterest)
                }
            }
        }
        .mapControls {
            MapPitchToggle()
            MapUserLocationButton()
            MapCompass()
        }
        .mapStyle(.standard(pointsOfInterest: .excludingAll))
        .task {
            await store.send(.pointsOfInterest(.fetchVenue))
        }
        .task {
            await store.send(.pointsOfInterest(.fetchPointsOfInterest))
        }
        .onAppear {
            let locationManager = CLLocationManager()
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        .sheet(item: $selectedPointOfInterest) { pointOfInterest in
            PointOfInterestSheet(pointOfInterest: pointOfInterest)
                .presentationBackground(.thinMaterial)
                .presentationDetents([.height(170)])
        }
    }

}

#Preview {
    let store = SwiftLeedsStore.preview

    return NavigationStack {
        PointsOfInterestMapView()
            .environment(store)
    }
}
