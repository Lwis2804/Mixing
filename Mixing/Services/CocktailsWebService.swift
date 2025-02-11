//
//  CocktailsWebService.swift
//  Mixing
//
//  Created by LUIS GONZALEZ on 22/07/24.
//

import Foundation

protocol NetworkApiProtocol : AnyObject {
    var urlConfiguration : CocktailsUrlCnfiguration { get set }
    func consumeWebService<T: Decodable> (withCompilationHandler handler : @escaping (Result <T,ErrorWebService>) -> Void )
}

class CocktailsWebService : NetworkApiProtocol {
    var urlConfiguration: CocktailsUrlCnfiguration
    
    init(urlConfiguration: CocktailsUrlCnfiguration){
        self.urlConfiguration = urlConfiguration
    }
    
    func consumeWebService<T>(withCompilationHandler handler: @escaping (Result<T, ErrorWebService>) -> Void) where T : Decodable {
        guard let url = urlConfiguration.cofingUrl() else {
            print("URL MAL FORMADA")
            handler(.failure(.wrongUrl))
            return }
        var strUrl = "\(url)"
        strUrl = strUrl.replacingOccurrences(of: "%3F", with: "?")
        URLSession.shared.dataTask(with: .init(url: URL(string: strUrl) ?? URL(fileURLWithPath: ""))){ data, response, _ in
            guard let data = data, let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) else {
                handler(.failure(.wrongJson))
                return
            }
            if let json = try? JSONDecoder().decode(T.self, from: data) {
                print("Recibo respuesta positiva de Json")
                handler(.success(json))
            }else{
                print("Recibo respuesta negativa de Json")
                handler(.failure(.wrongResponse))
            }
        }.resume()
    }
}
