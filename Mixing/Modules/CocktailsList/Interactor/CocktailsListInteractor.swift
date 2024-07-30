//  CocktailsListInteractor.swift
//  Mixing
//  Created by LUIS GONZALEZ on 22/07/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class CocktailsListInteractor: CocktailsList_PresenterToInteractorProtocol {
    
    weak var presenter: CocktailsList_InteractorToPresenterProtocol?
    var metodo : String = "https"
    var host : String = "www.thecocktaildb.com"
    
    func getCocktailsListToInteractor() {
        let service : NetworkApiProtocol = CocktailsWebService(urlConfiguration: CocktailsUrlCnfiguration(metodo: metodo, host: host, path: cocktailsPath.getCocktailList.getPath()))
        service.consumeWebService{ [weak self] (result : Result<CocktailsList, ErrorWebService>) in
            switch result {
            case .success(let success):
                print(result)
                self?.presenter?.getCocktailsListFromInteractor(withResponse: success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

