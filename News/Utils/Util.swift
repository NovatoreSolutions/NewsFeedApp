//
//  Util.swift
//  News
//
//  Created by Imran Jameel on 11/23/17.
//  Copyright © 2017 NovatoreSolutions. All rights reserved.
//

import Foundation
class Global {
let URL_API =  "http://siizamotvoreno.com/api/get_category_posts"
let SEARCH_URL = "http://siizamotvoreno.com/api/get_search_results"

typealias completion = ()->()
let css =
    "<style type=\"text/css\">" +
        "html{margin:0;padding:0;}" +
        "img{" +
        "max-width: 100%;" +
        "max-height: 200px" +
        "}" + "</>"



}
extension String {
    func deleteHTMLTag(tag:String) -> String {
        return self.replacingOccurrences(of:"(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
    }
    
    func deleteHTMLTags(tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag: tag)
        }
        return mutableString
    }
}

