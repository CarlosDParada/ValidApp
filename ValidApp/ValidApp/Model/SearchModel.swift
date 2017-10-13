//
//  SearchModel.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import Foundation

public class SearchModel_Base {
    public var page : Int?
    public var results : Array<Results>?
    public var total_pages : Int?
    public var total_results : Int?
    
    /**

     let SearchModel_Baselist = SearchModel_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [SearchModel_Base]
    {
        var models:[SearchModel_Base] = []
        for item in array
        {
            models.append(SearchModel_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**

     let searchModel_Base = SearchModel_Base(someDictionaryFromJSON)

     */
    required public init?(dictionary: NSDictionary) {
        
        page = dictionary["page"] as? Int
        if (dictionary["results"] != nil) { results = Results.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
        total_pages = dictionary["total_pages"] as? Int
        total_results = dictionary["total_results"] as? Int
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.page, forKey: "page")
        dictionary.setValue(self.total_pages, forKey: "total_pages")
        dictionary.setValue(self.total_results, forKey: "total_results")
        
        return dictionary
    }
    
}
