//
//  CocktailDetailViewController.swift
//  Cocktails
//
//  Created by Arian Mohajer on 2/2/22.
//

import UIKit

class CocktailDetailViewController: UIViewController {
    
    var cocktail: Cocktail?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var measurementsTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        
        setImage()
        
        guard let cocktail = cocktail else { return }
        drinkNameLabel.text = cocktail.name
        instructionsTextView.text = cocktail.instructions
        
        for i in 1...cocktail.ingredients.count - 1 {
            ingredientsTextView.text.append("\n" + cocktail.ingredients[i])
        }
        
        for i in 1...cocktail.measurementOfIngredients.count - 1{
            measurementsTextView.text.append("\n" + cocktail.measurementOfIngredients[i])
        }
    }
    
    func setImage() {
        guard let cocktail = cocktail else { return }
        guard let imageURL = URL(string: cocktail.imageURLString) else {return}
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    self.drinkImageView.image = image
                }
            }
        }
    }
}
