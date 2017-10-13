//
//  FavoriteViewController.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {


    @IBOutlet weak var nameMoviwField: UITextField!
    @IBOutlet weak var favoriteMoviesTable: UITableView!
    
    private var moviesFavorite = [MovieModel_Base]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorite Movies"
        favoriteMoviesTable.delegate = self
        favoriteMoviesTable.dataSource = self
        
        let nibNameCell = UINib(nibName : "VAMovieTableViewCell" , bundle : nil)
        favoriteMoviesTable.register(nibNameCell, forCellReuseIdentifier: "movieCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! VAMovieTableViewCell
        let movie : MovieModel_Base = self.moviesFavorite[indexPath.row-1]
        cell.nameMovie.text = loadDataMovie(id: movie.original_title!)
        
    }
    
    func loadDataMovie (id idMovie : String) ->  String {
        
        
        
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
