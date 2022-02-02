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
    
    var ingredient1: String
    var ingredient2: String
    var ingredient3: String
    var ingredient4: String
    var ingredient5: String
    var ingredient6: String
    var ingredient7: String
    var ingredient8: String
    var ingredient9: String
    var ingredient10: String
    
    var measurementOfIngredient1: String
    var measurementOfIngredient2: String
    var measurementOfIngredient3: String
    var measurementOfIngredient4: String
    var measurementOfIngredient5: String
    var measurementOfIngredient6: String
    var measurementOfIngredient7: String
    var measurementOfIngredient8: String
    var measurementOfIngredient9: String
    var measurementOfIngredient10: String
    
    var imageURLString: String
    
    init?(dictionary: [String:Any]) {
        
        guard let name = dictionary["strDrink"] as? String,
           let instructions = dictionary["strInstructions"] as? String,
           let ingredient1 = dictionary["strIngredient1"] as? String,
           let ingredient2 = dictionary["strIngredient2"] as? String,
           let ingredient3 = dictionary["strIngredient3"] as? String,
           let ingredient4 = dictionary["strIngredient4"] as? String,
           let ingredient5 = dictionary["strIngredient5"] as? String,
           let ingredient6 = dictionary["strIngredient6"] as? String,
           let ingredient7 = dictionary["strIngredient7"] as? String,
           let ingredient8 = dictionary["strIngredient8"] as? String,
           let ingredient9 = dictionary["strIngredient9"] as? String,
           let ingredient10 = dictionary["strIngredient10"] as? String,
           let measurementOfIngredient1 = dictionary["strMeasure1"] as? String,
           let measurementOfIngredient2 = dictionary["strMeasure2"] as? String,
           let measurementOfIngredient3 = dictionary["strMeasure3"] as? String,
           let measurementOfIngredient4 = dictionary["strMeasure4"] as? String,
           let measurementOfIngredient5 = dictionary["strMeasure5"] as? String,
           let measurementOfIngredient6 = dictionary["strMeasure6"] as? String,
           let measurementOfIngredient7 = dictionary["strMeasure7"] as? String,
           let measurementOfIngredient8 = dictionary["strMeasure8"] as? String,
           let measurementOfIngredient9 = dictionary["strMeasure9"] as? String,
           let measurementOfIngredient10 = dictionary["strMeasure10"] as? String,
           let imageURLString = dictionary["strDrinkThumb"] as? String else { return nil }
        
        self.name = name
        self.instructions = instructions
        self.ingredient1 = ingredient1
        self.ingredient2 = ingredient2
        self.ingredient3 = ingredient3
        self.ingredient4 = ingredient4
        self.ingredient5 = ingredient5
        self.ingredient6 = ingredient6
        self.ingredient7 = ingredient7
        self.ingredient8 = ingredient8
        self.ingredient9 = ingredient9
        self.ingredient10 = ingredient10
        self.measurementOfIngredient1 = measurementOfIngredient1
        self.measurementOfIngredient2 = measurementOfIngredient2
        self.measurementOfIngredient3 = measurementOfIngredient3
        self.measurementOfIngredient4 = measurementOfIngredient4
        self.measurementOfIngredient5 = measurementOfIngredient5
        self.measurementOfIngredient6 = measurementOfIngredient6
        self.measurementOfIngredient7 = measurementOfIngredient7
        self.measurementOfIngredient8 = measurementOfIngredient8
        self.measurementOfIngredient9 = measurementOfIngredient9
        self.measurementOfIngredient10 = measurementOfIngredient10
        self.imageURLString = imageURLString
    }
}
