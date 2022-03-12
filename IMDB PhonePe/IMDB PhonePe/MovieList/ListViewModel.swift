//
//  ListViewModel.swift
//  IMDB PhonePe
//
//  Created by Poonamchand Raykhere on 12/03/22.
//

import UIKit

class ListViewModel {
    
    var movieResult: MovieResult?
    var arrMovies = [Movie]()
        
    // get data from json
    func getMovies(completions: (_ arrMovies: [Movie]?)-> Void) {
        guard let path = Bundle.main.path(forResource: "movieList", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            movieResult = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            guard let list = movieResult?.results else {
                completions(nil)
                return
            }
            arrMovies = list
            completions(list)
        } catch {
            print(error)
            completions(nil)
        }
    }

}
