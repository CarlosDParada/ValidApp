//
//  VAMovieTableViewCell.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class VAMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var genMovie: UILabel!
    
    var movieModel : MovieModel_Base? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ imageName: String ,_ nameTheMovie : String ,_ genreMovie : String , _ idMovie : String){
        
        
        imageMovie.image = UIImage(named : imageName)
        nameMovie.text = nameTheMovie
        genMovie.text = genreMovie
        
    }
    
    func loadDataMovie (id idMovie : String) {
        
        // var moviesSelect1 : MovieModel_Base?
        let uRLString = "\(VAConstants.Webservice.PathDetailt)\(idMovie)?\(VAConstants.Webservice.api_key_title)=\(VAConstants.Webservice.api_key)&\(VAConstants.Webservice.lenguaje_title)=\(VAConstants.Webservice.lenguaje)&\(VAConstants.Webservice.pageappend_to_response_title)=\(VAConstants.Webservice.pageappend_to_response)"
        
        Alamofire.request(uRLString, method: .get , encoding: JSONEncoding.default).downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in
                
                if let result = response.result.value {
                    let JSONResult = result as! NSDictionary
                    self.movieModel = MovieModel_Base.init(dictionary:  JSONResult)
                    self.completeCell(MovieModel_Base: self.movieModel!)
                   // self.downloadImage(movieCell: self.movieModel!)
                }
        }

        
    }
    
    func completeCell(MovieModel_Base movie : MovieModel_Base )  {
        nameMovie.text = movie.original_title
        genMovie.text = movie.release_date
        
//        let imageView = UIImageView(frame: frame)
//        let url = URL(string: "https://httpbin.org/image/png")!
//        imageView.af_setImage(withURL: url)
//        imageMovie = imageView
        
        self.downloadImage(movieCell: self.movieModel!)
    }
    
    func downloadImage (movieCell movie : MovieModel_Base ){
        if movie.backdrop_path != nil {
            
            DataRequest.addAcceptableImageContentTypes(["image/jpg"])
            let uRLStringImage = "\(VAConstants.Webservice.PathImage)\( movie.backdrop_path! ))"
        
            Alamofire.request("\(uRLStringImage)").responseImage { response in
                debugPrint(response)
                
                if let image = response.result.value {
                    self.imageMovie.image = image
                    print("image downloaded: \(image)")
                }
            }
        }
    }
}
