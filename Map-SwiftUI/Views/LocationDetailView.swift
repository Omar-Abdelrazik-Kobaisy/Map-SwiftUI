//
//  LocationDetailView.swift
//  Map-SwiftUI
//
//  Created by Omar on 03/01/2024.
//

import SwiftUI

struct LocationDetailView: View {
    var location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                TabView{
                    ForEach(location.imageNames, id: \.self){image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.size.width)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(.page)
                
                VStack(alignment:.center, spacing: 15){
                    Text(location.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(location.cityName)
                        .font(.subheadline)
                    Text(location.description)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
    }
}
