//
//  Spoken_languages.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import Foundation


public class Spoken_languages {
    public var iso_639_1 : String?
    public var name : String?
    
    /**

     Sample usage:
     let spoken_languages_list = Spoken_languages.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Spoken_languages]
    {
        var models:[Spoken_languages] = []
        for item in array
        {
            models.append(Spoken_languages(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     let spoken_languages = Spoken_languages(someDictionaryFromJSON)
     */
    required public init?(dictionary: NSDictionary) {
        
        iso_639_1 = dictionary["iso_639_1"] as? String
        name = dictionary["name"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.iso_639_1, forKey: "iso_639_1")
        dictionary.setValue(self.name, forKey: "name")
        
        return dictionary
    }
    
}
