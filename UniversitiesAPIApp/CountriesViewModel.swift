//
//  UniversitiesViewModel.swift
//  UniversitiesAPIApp
//
//  Created by Mac on 07/12/2023.
//

import Foundation


@MainActor
class CountriesViewModel: ObservableObject {
    
//    struct Returned: Codable {
//
//
//    }
//
    @Published var countries: [Country] = []
    var urlString = "https://restcountries.com/v3.1/all"
    
    
    func sortData(){
        countries = countries.sorted(by: {$0.name.common < $1.name.common})
    }
    
    func getData() async {
        
        
        guard let url = URL(string: urlString) else { return }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            do{
                let returned = try JSONDecoder().decode([Country].self, from: data)
                countries = returned
                
                
            }catch{
                //TODO handle JSON decoding error
                print("Failed to decode json data", error)
            }
            
        }catch{
            //TODO handle getting data error
            print("Failed GET data from API", error)
        }
        
    }
    
    
}
