//
//  Network Controller.swift
//  Cocktails
//
//  Created by Arian Mohajer on 2/2/22.
//

import Foundation
import UIKit

class NetworkController {
    static private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php"
    
    static func fetchCocktails (filterLetter: String, completion: @escaping ([Cocktail]?) -> Void) {
        guard let baseURL = URL(string: baseURL) else {
            print("Failed to create URL from baseURL: \(baseURL)")
            completion(nil)
            return
        }
        
        let filterQuery = URLQueryItem(name: "f", value: filterLetter)
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [filterQuery]
        
        guard let finalURL = urlComponents?.url else {
            print("Unable to create finalURL based off of constructed URL: \(urlComponents?.url)")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                print("There was an error with your finalURL: \(finalURL).", error)
                completion(nil)
            }
            
            if let data = data {
                do {
                    if let topLevelDictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                        
                        var listOfCocktails = [Cocktail]()
                        if let arrayOfCocktails = topLevelDictionary["drinks"] as? [[String: Any]]  {
                            
                            for cocktailDictionary in arrayOfCocktails {
                                guard let newCocktail = Cocktail(dictionary: cocktailDictionary) else { return }
                                listOfCocktails.append(newCocktail)
                            }
                        }
                            
                        completion(listOfCocktails)
                    }
                    
                } catch {
                    print("There was an error serializing data. ", error)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    static func fetchCocktailImage(cocktail: Cocktail, completion: @escaping (UIImage?) -> Void) {

        guard let imageURL = URL(string: cocktail.imageURLString) else {return}
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("Error on image \(error.localizedDescription)")
            }
            
            if let data = data {
                guard let cocktailImage = UIImage(data: data) else {completion(nil); return}
                completion(cocktailImage)
            }
            
        }.resume()

    }
}
