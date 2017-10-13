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
    @IBOutlet weak var favoriteMoviesView: UITableView!
    
    private var moviesFavorite = [MovieModel_Base]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorite Movies"
        favoriteMoviesView.delegate = self
        favoriteMoviesView.dataSource = self
        
        let nibNameCell = UINib(nibName : "VAMovieTableViewCell" , bundle : nil)
        favoriteMovies
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
