//
//  LocationPreviewView.swift
//  Map-SwiftUI
//
//  Created by Omar AbdElrazek on 02/01/2024.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var location: Location
    var body: some View {
        HStack(alignment:.bottom){
            VStack(alignment:.leading,spacing:16){
                imageSection
                headerSection
            }
            
            VStack(spacing: 15){
                Button(action: {
                    
                }, label: {
                    CustomeButton(title: "Learn more")
                })
                .buttonStyle(.borderedProminent)
                
                Button {
                    withAnimation {
                        vm.nextButtonPressed()
                    }
                } label: {
                    CustomeButton(title: "Next")
                }
                .buttonStyle(.bordered)

            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:56)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
            .padding()
    }
}
extension LocationPreviewView{
    private var imageSection: some View{
        ZStack{
            Image(location.imageNames.first!)
                .resizable()
                .frame(width: 100,height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(6)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var headerSection: some View{
        VStack(alignment:.leading){
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
    }
}
struct CustomeButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .frame(width: 130, height: 35)
    }
}
