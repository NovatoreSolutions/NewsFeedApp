//
//  SearchViewController.swift
//  News
//
//  Created by Imran Jameel on 11/23/17.
//  Copyright © 2017 NovatoreSolutions. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

    let search = Search()
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegates
        searchBar.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    
    @IBAction func backPressed(_ sender: Any) {
        _ =  self.navigationController?.popViewController(animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search.requestAll(search: searchBar.text!) {
            self.searchTableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search.refreshPosts()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchCell") as? SearchCell {
            cell.configCell(search: search, index: indexPath.row)
            
            return cell
        }
        return SearchCell()
    }
   
}
