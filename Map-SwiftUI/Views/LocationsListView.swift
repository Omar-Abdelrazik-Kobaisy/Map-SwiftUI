//
//  LocationsListView.swift
//  Map-SwiftUI
//
//  Created by Omar AbdElrazek on 01/01/2024.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    withAnimation {
                        vm.showNextLocation(location: location)
                    }
                } label: {
                    ListLocationItemView(location: location)
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

struct ListLocationItemView: View {
    var location: Location
    var body: some View {
        HStack{
            if let image = location.imageNames.first{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60,height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            VStack(alignment:.leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth:.infinity,alignment:.leading)
        }
    }
}
