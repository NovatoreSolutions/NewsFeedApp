//
//  Search.swift
//  News
//
//  Created by Imran Jameel on 11/23/17.
//  Copyright © 2017 NovatoreSolutions. All rights reserved.
//

import Foundation
import Alamofire

class Search {

    //Private Arrays
    private var _profileImgs = [String]()
    private var _contents = [String]()
    private var _titles = [String]()
    private var _dates = [String]()
    private var _authors = [String]()
    private var _slugs = [String]()
    
    
    var titles: [String] {
        return _titles
    }
    var contents: [String] {
        return _contents
    }
    var profileImgs: [String] {
        
        return _profileImgs
    }
    var dates: [String] {
        return _dates
    }
    var authors: [String] {
        return _authors
    }
    var slugs:[String]{
        return _slugs
    }
    
    func requestAll(search: String,completed: @escaping completion){
        Alamofire.request(SEARCH_URL, parameters: ["search":search]).responseJSON { (response) in
            if let json = response.result.value {
                print(json)
                if let postsDict = json as? Dictionary<String,AnyObject> {
                    
                    if let dictArray = postsDict["posts"] as? [Dictionary<String,AnyObject>] {
                        var i = 0
                        print(dictArray)
                        for dict in dictArray {
                            
                            if let content = dictArray[i]["content"] as? String {
                                self._contents.append(content)
                            }
                            
                            if let title = dictArray[i]["title"] as? String {
                                self._titles.append(title)
                            }
                            
                            if let date = dictArray[i]["date"] as? String {
                                self._dates.append(date)
                            }
                            
                            if let author = dictArray[i]["excerpt"] as? String {
                                self._authors.append(author)
                                
                            }
                            
                            if let catArray = dictArray[i]["categories"] as? [Dictionary<String,AnyObject>]{
                                
                                if let slug = catArray[0]["slug"] as? String {
                                    self._slugs.append(slug)
                                }
                                
                            }
                            
                            if let dict = dict["thumbnail_images"] as? Dictionary<String,AnyObject>{
                                if let imgDict = dict["mosaic_small"] as? Dictionary<String,AnyObject> {
                                    if let url = imgDict["url"] as? String {
                                        self._profileImgs.append(url)
                                    }
                                }
                            }
                            i += 1
                        }
                        completed()
                    }
                }
            }
        }
    }
    
    func refreshPosts() {
        self._profileImgs = []
        self._titles = []
        self._dates = []
        self._authors = []
        self._contents = []
        self._slugs = []
    }
    
    
}
