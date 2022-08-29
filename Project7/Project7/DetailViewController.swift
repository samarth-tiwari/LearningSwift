//
//  DetailViewController.swift
//  Project7
//
//  Created by Samarth Tiwari on 20/07/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        // Use one of these methods to load views do1 or do2
//        do1()
        do2()
        
        
        
            
    }
    
    func do2(){
        guard let detailItem = detailItem else {
            return
        }

        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
    var titleLabel: UILabel!
    func do1() {
        titleLabel = UILabel()
        titleLabel.text = detailItem?.body
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0

        view.addSubview(titleLabel)
        
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
