//
//  CocktailsListCollectionViewCell.swift
//  Mixing
//
//  Created by LUIS GONZALEZ on 22/07/24.
//

import UIKit

class CocktailsListCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cocktailImage: UIImageView!
    @IBOutlet var cocktailName: UILabel!
    
    var downloadTask : URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCocktailCell(withEntry entry : Drinks?) {
        guard let entrada = entry else { return }
        self.cocktailName.text = "\(entrada.strDrink ?? "")"
        if let urlThumb = entrada.strDrinkThumb,
           let url = URL(string:"https://www.thecocktaildb.com/images/media/drink/\(urlThumb)"){
            downloadTask = self.cocktailImage.loadImage(url: url)
        }
    }

}
