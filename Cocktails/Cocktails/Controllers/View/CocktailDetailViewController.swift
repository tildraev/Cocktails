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
        fetchCocktailImage()
        updateView()
    }
    
    func updateView() {
        
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
    
    func fetchCocktailImage() {
        guard let cocktail = cocktail else { return }
        
        NetworkController.fetchCocktailImage(cocktail: cocktail) { drinkImage in
            guard let drinkImage = drinkImage else { return }
            
            DispatchQueue.main.async {
                self.drinkImageView.image = drinkImage
            }
        }
    }
}
