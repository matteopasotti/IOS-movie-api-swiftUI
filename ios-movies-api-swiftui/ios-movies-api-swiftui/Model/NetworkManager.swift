//
//  NetworkManager.swift
//  ios-movies-api-swiftui
//
//  Created by Matteo Pasotti on 21/05/2020.
//  Copyright © 2020 Matteo Pasotti. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    let apiKey = "d0ac984349d63f4af1bbea3359b8fdbc"
    
    @Published var movies = [Movie]()
    
    func fetchPopularMovies() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        if  let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let items = try decoder.decode(Movies.self, from: safeData)
                            DispatchQueue.main.async {
                                self.movies = items.results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
        
        
    }
    
}

 
