//
//  Production_countries.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import Foundation

public class Production_countries {
    public var iso_3166_1 : String?
    public var name : String?
    
    /**
     
     let production_countries_list = Production_countries.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Production_countries]
    {
        var models:[Production_countries] = []
        for item in array
        {
            models.append(Production_countries(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        iso_3166_1 = dictionary["iso_3166_1"] as? String
        name = dictionary["name"] as? String
    }

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.iso_3166_1, forKey: "iso_3166_1")
        dictionary.setValue(self.name, forKey: "name")
        
        return dictionary
    }
    
}
