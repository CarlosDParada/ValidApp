//
//  SearchMovieViewController.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import UIKit

class SearchMovieViewController: UIViewController,  UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var searchMovieField: UITextField!
    @IBOutlet weak var listMoviesView: UITableView!
    
    private var moviesFavorite = [MovieModel_Base]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listMoviesView.delegate = self
        listMoviesView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// #MARK: - NumberOfRows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
