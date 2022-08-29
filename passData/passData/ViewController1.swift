//
//  ViewController1.swift
//  passData
//
//  Created by Samarth Tiwari on 12/08/22.
//

import UIKit

class ViewController1: UITableViewController {
    
    var dataPasser: ((String?) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "View Controller 1"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        dataPasser?(String(data))
        navigationController?.popViewController(animated: true)
    }
}
