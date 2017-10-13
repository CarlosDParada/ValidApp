//
//  SearchMovieViewController.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import UIKit
import Alamofire

class SearchMovieViewController: UIViewController,  UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var searchMovieField: UITextField!
    @IBOutlet weak var listMoviesTableView: UITableView!
    public var tempDict  = NSDictionary()
    private var allMovies : SearchModel_Base?
    private var moviesFavorite = [MovieModel_Base]()

    override func viewDidLoad() {
        
        searchMovieByText(string: "Rose")
        
        super.viewDidLoad()
        
        listMoviesTableView.delegate = self
        listMoviesTableView.dataSource = self
        
        //Custom Cell
        let nibNameCell = UINib(nibName : "VAMovieTableViewCell" , bundle : nil)
        listMoviesTableView.register(nibNameCell, forCellReuseIdentifier: "movieCell")
        
//        self.allMovies =
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// #MARK: - NumberOfRows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.allMovies?.results != nil {
            let allMoviesById = self.allMovies?.results?.count
            return allMoviesById!
        }else{
            return 0
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! VAMovieTableViewCell
       // let idMovie = String (describing: allMovies[0].results![indexPath.row].id)
        //let movie : MovieModel_Base = loadDataMovie(id: idMovie)
       
        
      //  cell.nameMovie.text = movie.original_title
        
        
        return cell
        
    }
    func searchMovieByText (string textInfield : String)  {
        
        
        let uRLString = "\(VAConstants.Webservice.PathSearch)?\(VAConstants.Webservice.api_key_title)=\(VAConstants.Webservice.api_key)&\(VAConstants.Webservice.query_title)=\(textInfield)&\(VAConstants.Webservice.page_title)=\(VAConstants.Webservice.page)"
       
        Alamofire.request(uRLString, method: .get , encoding: JSONEncoding.default).downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in

                if let result = response.result.value {
                    let JSONResult = result as! NSDictionary
                    self.allMovies = SearchModel_Base.init(dictionary:  JSONResult)
                    print(self.allMovies)
                   
                }
        }
//        return self.allMovies[0]
        
    }
    
//    func loadDataMovie (id idMovie : String) ->  MovieModel_Base {
////        let searchModel = SearchModel_Base()
//
//        let parametersLM : [String : Any ] = [
//            "\(VAConstants.Webservice.api_key_title)" : "\(VAConstants.Webservice.api_key)",
//            "\(VAConstants.Webservice.query_title)" :  "\(VAConstants.Webservice.query)",
//            "\(VAConstants.Webservice.page_title)" : "\(VAConstants.Webservice.page)"
//        ]
//
//        Alamofire.request(VAConstants.Webservice.PathInit, method: .get , parameters: parametersLM, encoding: JSONEncoding.default).downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
//            print("Progress: \(progress.fractionCompleted)")
//            }
//            .validate { request, response, data in
//
//                return .success
//            }
//            .responseJSON { response in
//                debugPrint(response)
//        }
//
////            let searchModel = SearchModel_Base.modelsFromDictionaryArray(arr) as Array
//            print(searchModel)
//
//        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
