//
//  VAConstants.swift
//  ValidApp
//
//  Created by Carlos Parada on 10/12/17.
//  Copyright © 2017 carlosparada. All rights reserved.
//

import Foundation

public struct VAConstants {
    
    public struct Webservice{
        public static var PathInit = "https://api.themoviedb.org/3/search/keyword/"
        public static var PathSearch = "https://api.themoviedb.org/3/search/keyword"
        
        public static var api_key_title = "api_key"
        public static var api_key = "12956a722c68d23f60961096eaebdd15"
        
        public static var page_title = "page"
        public static var page = "1"
        
        public static var lenguaje_title = "lenguaje"
        public static var lenguaje = "es-CO"
        //English = en-US
        // Spanish CO = es-CO
        
        public static var query_title = "query"
        public static var query = "1"
        
        public static var pageappend_to_response_title = "pageappend_to_response"
        public static var pageappend_to_response = "1"
        
        public static var PathImage = "https://image.tmdb.org/t/p/w300/"
        // w300 is Width 300px
    }
    
    
}
