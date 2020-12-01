//
//  CoronaData.swift
//  PocketApp
//
//  Created by marvin evins on 11/30/20.
//

import Foundation

class CoronaData {
//    struct Returned: Codable{
//        var state: String
//        var positive: Int
//
//    }
    
    var stateArray: [StateData] = []
    
    var urlString = "https://api.covidtracking.com/v1/states/current.json"
    
    
    func getData(completed: @escaping ()-> ()){
        
        print("we are accessing the url \(urlString)")
        
        //create a url
        
        guard let url = URL(string: urlString) else{
            print("Error: colud not create a url from \(urlString)")
            completed()
                return
        }
        
        //create a session
        
        let session = URLSession.shared
        
        //GET THE DATA WITH .dataTask method
        
        let task = session.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("error: \(error.localizedDescription  )")
            }
            
            //deal with the data
            do {
                let returned = try JSONDecoder().decode([StateData].self, from: data!)
                self.stateArray = returned
                
                
                
            }catch{
                print(" json error: \(error.localizedDescription  )")

            }
            completed()
        }
        task.resume()
        
        
    }
}
