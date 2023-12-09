//
//  UniversityView.swift
//  UniversitiesAPIApp
//
//  Created by Mac on 07/12/2023.
//

import SwiftUI

struct CountryView: View {
    
    let country: Country
    var body: some View {
        VStack(alignment: .leading){
            
            Text(country.name.common)
                .font(.largeTitle)
                .bold()
            
            Rectangle()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
            
            Group{
                
                HStack(alignment: .top){
                    Text("Official Name: ")
                        .bold()
                    
                    Text(country.name.official)
                    
                    
                }
                
                HStack(alignment: .top){
                    Text("Independent: ")
                        .bold()
                    
                    Text(String((country.independent)!))
                }
                
                HStack(alignment: .top){
                    Text("UN Member: ")
                        .bold()
                
                    Text(String(country.unMember))
                }
                
                
            }.font(.title2)
            
            VStack{
                AsyncImage(url:URL(string: country.flags.png)){
                    img in img.resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 15)
                        .animation(.default, value: img)
                        
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
        }
        .padding().navigationBarTitleDisplayMode(.inline)
        
       
    }
}

struct UniversityView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: Country(name: CountryName(common: "Israel", official: "State Of Israel"), independent: true, unMember: true, flags: Flag(png: "flag.png")))
    }
}
