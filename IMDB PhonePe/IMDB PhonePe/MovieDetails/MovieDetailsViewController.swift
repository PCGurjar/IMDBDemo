//
//  MovieDetailsViewController.swift
//  IMDB PhonePe
//
//  Created by Poonamchand Raykhere on 12/03/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelPopularity: UILabel!

    
    var movie: Movie?
    
    init(model: Movie) {
        self.movie = model
        super.init(nibName: "MovieDetailsViewController", bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setViewData()
    }

    
    func setViewData() {
        if let m = movie {
            self.title = m.title
            labelDescription.text = m.overview
            imageMovie.loadImageUsingCache(withUrl: Constants.posterBaseURL + m.posterPath)
            labelRating.text = "\(m.voteAverage)"
            labelReleaseDate.text = m.releaseDate
            labelPopularity.text = "\(m.voteCount)"
        }
    }
}
