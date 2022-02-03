//
//  CocktailListTableViewController.swift
//  Cocktails
//
//  Created by Arian Mohajer on 2/2/22.
//

import UIKit

class CocktailListTableViewController: UITableViewController {

    var alphabeticalIndex = 0
    var filterLetter = "a"
    
    var listOfCocktails: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkController.fetchCocktails(filterLetter: filterLetter) { listOfCocktails in
            guard let listOfCocktails = listOfCocktails else { return }
            self.listOfCocktails = listOfCocktails
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func previousButtonTapped(_ sender: Any) {
        if alphabeticalIndex > 0 {
            alphabeticalIndex -= 1
            
            filterByLetter()
            
            NetworkController.fetchCocktails(filterLetter: filterLetter) { listOfCocktails in
                if let listOfCocktails = listOfCocktails {
                    self.listOfCocktails = listOfCocktails
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if alphabeticalIndex < 25 {
            alphabeticalIndex += 1
            
            filterByLetter()
            
            NetworkController.fetchCocktails(filterLetter: filterLetter) { listOfCocktails in
                if let listOfCocktails = listOfCocktails {
                    self.listOfCocktails = listOfCocktails
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfCocktails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath)
        
        cell.textLabel?.text = listOfCocktails[indexPath.row].name

        // Configure the cell...

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCocktailDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? CocktailDetailViewController {
                    let newCocktail = listOfCocktails[index.row]
                    destination.cocktail = newCocktail
                }
            }
        }
    }
    
    func filterByLetter(){
        switch alphabeticalIndex {
        case 0: filterLetter = "a"
        case 1: filterLetter = "b"
        case 2: filterLetter = "c"
        case 3: filterLetter = "d"
        case 4: filterLetter = "e"
        case 5: filterLetter = "f"
        case 6: filterLetter = "g"
        case 7: filterLetter = "h"
        case 8: filterLetter = "i"
        case 9: filterLetter = "j"
        case 10: filterLetter = "k"
        case 11: filterLetter = "l"
        case 12: filterLetter = "m"
        case 13: filterLetter = "n"
        case 14: filterLetter = "o"
        case 15: filterLetter = "p"
        case 16: filterLetter = "q"
        case 17: filterLetter = "r"
        case 18: filterLetter = "s"
        case 19: filterLetter = "t"
        case 20: filterLetter = "u"
        case 21: filterLetter = "v"
        case 22: filterLetter = "w"
        case 23: filterLetter = "x"
        case 24: filterLetter = "y"
        case 25: filterLetter = "z"
        default: filterLetter = "a"
        }
    }
}
