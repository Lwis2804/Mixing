//
//  CocktailsPath.swift
//  Mixing
//
//  Created by LUIS GONZALEZ on 22/07/24.
//

import Foundation


enum cocktailsPath {
    
case getCocktailList
    
    func getPath() -> String {
        switch self {
        case .getCocktailList:
            return "/api/json/v1/1/search.php?f=a"
        }
    }
    
}



