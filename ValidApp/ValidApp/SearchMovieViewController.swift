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
    private var moviesSelect : MovieModel_Base?

    override func viewDidLoad() {
        
        searchMovieByText(string: "Car")
        
        super.viewDidLoad()
        
        listMoviesTableView.delegate = self
        listMoviesTableView.dataSource = self
        
        //Custom Cell
        let nibNameCell = UINib(nibName : "VAMovieTableViewCell" , bundle : nil)
        listMoviesTableView.register(nibNameCell, forCellReuseIdentifier: "movieCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
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
        let idMovie = String (describing: self.allMovies?.results![indexPath.row].id ?? 0)
        cell.loadDataMovie(id: idMovie)
        cell.nameMovie.text = idMovie
        return cell
        
    }
    

    func searchMovieByText (string textInfield : String)  {
        
        
        let uRLString = "\(VAConstants.Webservice.PathSearch)?\(VAConstants.Webservice.api_key_title)=\(VAConstants.Webservice.api_key)&\(VAConstants.Webservice.query_title)=\(textInfield)&\(VAConstants.Webservice.page_title)=\(VAConstants.Webservice.page)"
       
        Alamofire.request(uRLString, method: .get , encoding: JSONEncoding.default).downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
//            print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in

                if let result = response.result.value {
                    let JSONResult = result as! NSDictionary
                    self.allMovies = SearchModel_Base.init(dictionary:  JSONResult)
                    self.listMoviesTableView.reloadData()
                }
        }
    }
    
 
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
