//
//  CocktailsUrlConfiguratiion.swift
//  Mixing
//
//  Created by LUIS GONZALEZ on 22/07/24.
//

import Foundation

struct CocktailsUrlCnfiguration {
    
    var metodo : String
    var host : String
    var path : PathsProtocol
    
    public init(metodo: String, host: String, path : PathsProtocol) {
        self.metodo = metodo
        self.host = host
        self.path = path
    }
    
    func cofingUrl() -> URL? {
        guard !host.isEmpty else { return nil }
        var componentes : URLComponents = URLComponents()
        componentes.scheme = metodo
        componentes.host = host
        componentes.path = path.pathToUse
        return componentes.url
    }
}
