//
//  ViewController.swift
//  Project7
//
//  Created by Samarth Tiwari on 20/07/22.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Petitions"
        
        
        
        let credits = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        let filter =  UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filter))
        navigationItem.rightBarButtonItems = [filter,credits]
        
        
        let urlString: String

        if navigationController?.tabBarItem.tag == 0 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're ok to parse
                parse(json: data )
                return
            }
        }
        showError()
        
    }
    
    @objc func filter() {
        let ac = UIAlertController(title: "Filter", message: "Enter a word", preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(word: answer)
        }
        
        ac.addAction(submitAction)
        ac.addAction(UIAlertAction(title: "Clear Filter", style: .default, handler: clearFilter))
        present(ac, animated: true)
    }
    
    func clearFilter(_ action: UIAlertAction) {
        filteredPetitions = petitions
        tableView.reloadData()
    }
    
    func submit(word: String) {
        filteredPetitions = []
        for petition in petitions {
            if petition.title.contains(word) || petition.body.contains(word) {
                filteredPetitions.append(petition)
            }
        }
        tableView.reloadData()
    }
    
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "This data was brought to you by \"We the people\" API of the White House", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Error", message: "There was a problem loading the feed, please check your connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

