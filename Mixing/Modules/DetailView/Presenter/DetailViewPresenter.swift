//  DetailViewPresenter.swift
//  Mixing
//  Created by LUIS GONZALEZ on 01/08/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class DetailViewPresenter: DetailView_ViewToPresenterProtocol {
     
    weak var view: DetailView_PresenterToViewProtocol?
    var interactor: DetailView_PresenterToInteractorProtocol?
    var router: DetailView_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension DetailViewPresenter: DetailView_InteractorToPresenterProtocol {
    func getToCocktailsListFromInteractor(withResponse response: Drinks) {
        view?.updateCocktailsListFromInteractor(withResponse: response)
    }
    

}
