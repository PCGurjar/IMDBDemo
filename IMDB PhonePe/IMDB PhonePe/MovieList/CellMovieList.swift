//
//  CellMovieList.swift
//  IMDB PhonePe
//
//  Created by Poonamchand Raykhere on 12/03/22.
//

import UIKit

class CellMovieList: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    var movie: Movie? {
        didSet {
            if let m = movie {
                labelName.text = m.title
                labelDescription.text = m.overview
                imageMovie.loadImageUsingCache(withUrl: Constants.posterBaseURL + m.posterPath)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
