//
//  MovieListViewController.swift
//  IMDB PhonePe
//
//  Created by Poonamchand Raykhere on 12/03/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableMovieList: UITableView!

    var movieVm = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tableMovieList.delegate = self
        tableMovieList.dataSource = self
        
        movieVm.getMovies { movies in
            tableMovieList.reloadData()
        }
    }
    
}


// MARK:- Table view methods

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieVm.arrMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellMovieList", for: indexPath) as? CellMovieList else{
            return UITableViewCell()
        }
        cell.movie = movieVm.arrMovies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = movieVm.arrMovies[indexPath.row]
        let coordinator = DetailsViewCoordinator(controller: self.navigationController, model: model)
        coordinator.route()
    }
}
