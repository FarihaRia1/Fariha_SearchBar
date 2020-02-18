//
//  ViewController.swift
//  FarihaSearchbar
//
//  Created by apple on 2/17/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    var search_item = ["Apple","Orange","Banana","Grape","Jackfruit"]
    var search = [String]()
    var searching = false
    
    
    @IBOutlet weak var searchbr: UISearchBar!
    @IBOutlet weak var mytableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbr.delegate =  self as! UISearchBarDelegate
        searchDesign()
        // Do any additional setup after loading the view.
    }
    func searchDesign() {
        searchbr.searchTextField.layer.borderWidth = 2
        searchbr.searchTextField.layer.borderColor = UIColor.black.cgColor
        searchbr.searchTextField.layer.cornerRadius = 8
        
        searchbr.layer.backgroundColor = UIColor.black.cgColor
        searchbr.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return search.count
        }else{
            return search_item.count
        }
        
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if searching {
                cell?.textLabel!.text = search[indexPath.row]
            }else{
                cell?.textLabel!.text = search_item[indexPath.row]
            }
            return cell!
        }
    
        
    }
//MARK: Seraching Bar
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        search = search_item.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        searching = true
        mytableview.reloadData()
    }
    
    //Search Cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        mytableview.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    
}
