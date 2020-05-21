//
//  ContentView.swift
//  ios-movies-api-swiftui
//
//  Created by Matteo Pasotti on 21/05/2020.
//  Copyright © 2020 Matteo Pasotti. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager =  NetworkManager()
    
    var body: some View {
        
        
        //whenever NetworkManager posts changes, it triggers here
        List(networkManager.movies) { movie in
            Text("\(movie.title)")
        }
            
            
        .onAppear {
            self.networkManager.fetchPopularMovies()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
