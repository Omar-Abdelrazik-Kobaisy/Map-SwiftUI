//
//  LocationsView.swift
//  Map-SwiftUI
//
//  Created by Omar AbdElrazek on 01/01/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
//    @State private var aboutLocation: Location?
    var body: some View {
        ZStack{
            
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapMarker(coordinate: location.coordinates, tint: .blue)
            })
                .ignoresSafeArea()
//            Map(position: $vm.mapRegion) {
//                ForEach(vm.locations) { location in
//                    Marker("", coordinate: location.coordinates)
//                }
//
//            }
            
            VStack{
                header
                .padding()
                Spacer()
                ZStack{
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(color: .black,radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading)))
                        }
                    }
                }
            }.sheet(item: $vm.showSheetLocation) { location in
                LocationDetailView(location: location)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsView{
    var header: some View{
        VStack{
            Text(vm.mapLocation.name+", "+vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    withAnimation(.easeInOut) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .rotationEffect(.degrees(vm.isShowingLocationList ? 0 : 180))
                    }
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        vm.isShowingLocationList.toggle()
                    }
                }
            if vm.isShowingLocationList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
        .shadow(color: .black.opacity(0.6), radius: 15,x: 0,y: 15)
    }
}
