//
//  Genres.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import Foundation

public class Genres {
    
    public var id : Int?
    public var name : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [Genres]
    {
        var models:[Genres] = []
        for item in array
        {
            models.append(Genres(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        
        return dictionary
    }
    
}
