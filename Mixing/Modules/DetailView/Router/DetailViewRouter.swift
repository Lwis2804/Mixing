//  DetailViewRouter.swift
//  Mixing
//  Created by LUIS GONZALEZ on 01/08/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class DetailViewRouter {
	
    static func createModule(andInfo infoInPreviousClass : Drinks ) -> UIViewController {
        
        let view = DetailViewViewController()
        let presenter = DetailViewPresenter()
        let interactor = DetailViewInteractor()
        let router = DetailViewRouter()
        
        view.presenter = presenter
        view.recibeInfo = infoInPreviousClass
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension DetailViewRouter: DetailView_PresenterToRouterProtocol {
    
}
