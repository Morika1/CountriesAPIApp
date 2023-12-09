//
//  ContentView.swift
//  UniversitiesAPIApp
//
//  Created by Mac on 07/12/2023.
//

import SwiftUI

struct CountriesView: View {
    
    @StateObject var countriesVM = CountriesViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                List(searchResults){ country in NavigationLink {
                    CountryView(country: country)
                } label: {
                    Text(country.name.common)
                }

                    
                    
                }.font(.title).navigationTitle("Countries")
                    .listStyle(.plain)
                    .searchable(text:$searchText, prompt: "Search Country")
                
                Button {
                    countriesVM.sortData()
                } label: {
                    Text("SORT")
                }

            }
                
            
        }
        .task{
            await countriesVM.getData()
        }
    }
    
    var searchResults: [Country]{
        if searchText.isEmpty{
            return countriesVM.countries
        }
        
        return countriesVM.countries.filter({$0.name.official.contains(searchText)})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
