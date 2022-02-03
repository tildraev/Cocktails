//
//  Cocktail.swift
//  Cocktails
//
//  Created by Arian Mohajer on 2/2/22.
//

import Foundation

class Cocktail {
    
    var name: String
    var instructions: String
    var ingredients: [String] = []
    var measurementOfIngredients: [String] = []
    var imageURLString: String
    
    init?(dictionary: [String:Any]) {
        
        guard let name           = dictionary["strDrink"]        as? String else { return nil }
        guard let instructions   = dictionary["strInstructions"] as? String else { return nil }
        guard let imageURLString = dictionary["strDrinkThumb"]   as? String else { return nil }
        
        for ingredientIndex in 1...15 {
            
            if let ingredient = dictionary["strIngredient\(ingredientIndex)"] as? String {
                ingredients.append(ingredient)
            }
        }
        
        for ingredientMeasurementIndex in 1...15 {
            
            if let ingredientMeasurement = dictionary["strMeasure\(ingredientMeasurementIndex)"] as? String {
                measurementOfIngredients.append(ingredientMeasurement)
            }
        }
        
        self.name = name
        self.instructions = instructions
        self.imageURLString = imageURLString
    }
}
