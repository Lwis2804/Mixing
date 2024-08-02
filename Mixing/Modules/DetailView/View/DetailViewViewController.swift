//  DetailViewViewController.swift
//  Mixing
//  Created by LUIS GONZALEZ on 01/08/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class DetailViewViewController: UIViewController {
    
    @IBOutlet var nameCocktail: UILabel!
    @IBOutlet var imageCocktail: UIImageView!
    @IBOutlet var ingredientesCocktail: UILabel!
    @IBOutlet var lblIngr1: UILabel!
    @IBOutlet var lblIngr2: UILabel!
    @IBOutlet var lblIngr4: UILabel!
    @IBOutlet var lblIngr3: UILabel!
    @IBOutlet var lblInstructions: UILabel!
    
    
    var presenter: DetailView_ViewToPresenterProtocol?
    var recibeInfo : Drinks = Drinks()
    var downloadTask : URLSessionDownloadTask?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewInfo()
    }
    
    func setUpViewInfo(){
        self.nameCocktail.text = self.recibeInfo.strDrink
        self.ingredientesCocktail.text = "INGREDIENTES"
        self.lblIngr1.text = self.recibeInfo.strIngredient1
        self.lblIngr2.text = self.recibeInfo.strIngredient2
        self.lblIngr3.text = self.recibeInfo.strIngredient3
        self.lblIngr4.text = self.recibeInfo.strIngredient4
        self.lblInstructions.text = self.recibeInfo.strInstructionsES
        if let urlThumb = self.recibeInfo.strDrinkThumb,
           let url = URL(string: "\(urlThumb)"){
           downloadTask = imageCocktail.loadImage(url: url)
        }
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension DetailViewViewController: DetailView_PresenterToViewProtocol {
    func updateCocktailsListFromInteractor(withResponse reponse: Drinks) {
        self.recibeInfo = reponse
    }
    
}
