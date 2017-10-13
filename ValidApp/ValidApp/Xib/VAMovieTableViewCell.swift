//
//  VAMovieTableViewCell.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import UIKit

class VAMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var genMovie: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ imageName: String ,_ nameTheMovie : String ,_ genreMovie : String ){
        
        imageMovie.image = UIImage(named : imageName)
        nameMovie.text = nameTheMovie
        genMovie.text = genreMovie
        
    }
    
}
