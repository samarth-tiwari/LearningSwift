//
//  ViewController.swift
//  Project4 Challenge
//
//  Created by Samarth Tiwari on 18/07/22.
//

import UIKit
import WebKit

class ViewController: UITableViewController {
    
    var webView: WKWebView!
    var websites = ["apple.com", "google.com","hackingwithswift.com"];
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       title = "Websites to Open"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked on element \(indexPath.row)")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebsiteView") as? WebsiteViewController {
            vc.str = websites[indexPath.row]
            vc.websites = websites
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

