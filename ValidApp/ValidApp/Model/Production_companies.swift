//
//  Production_companies.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import Foundation
public class Production_companies {
    public var name : String?
    public var id : Int?
    
    /**
    
     let production_companies_list = Production_companies.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     */
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Production_companies]
    {
        var models:[Production_companies] = []
        for item in array
        {
            models.append(Production_companies(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        name = dictionary["name"] as? String
        id = dictionary["id"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.id, forKey: "id")
        
        return dictionary
    }
}
