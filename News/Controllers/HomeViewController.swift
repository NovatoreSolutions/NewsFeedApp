//
//  HomeViewController.swift
//  News
//
//  Created by Imran Jameel on 11/23/17.
//  Copyright © 2017 NovatoreSolutions. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    //Initializations
    private let refreshControl = UIRefreshControl()
    let home = Home()
    
    //Table View
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view delegates
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        //pull to refresh table view
        homeTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(self.refreshData(sender:)), for: .valueChanged)
        
        //Getting new posts
        downloadPosts()
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = homeTableView.dequeueReusableCell(withIdentifier: "homeCell") as? HomeCell {
            cell.configCell(home: self.home, index: indexPath.row)
            return cell
        }
        return HomeCell()
    }
    
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let lastElement = home.titles.count - 1
        if indexPath.row == lastElement {
            home.requestAll {
                self.homeTableView.reloadData()
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            home.requestAll {
                self.homeTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeSegue" {
            if let homeDetail = segue.destination as? HomeDetailVC {
                homeDetail.content  = home.contents[(homeTableView.indexPathForSelectedRow?.row)!]
                print((homeTableView.indexPathForSelectedRow?.row)!)
            }
        }
    }
    
    func refreshData(sender: UIRefreshControl) {
        self.reloadInputViews()
        refreshControl.endRefreshing()
    }
    
    func downloadPosts() {
        home.requestAll(){
            self.homeTableView.reloadData()
        }
    }
    

}
