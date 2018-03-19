//
//  EntryList.swift
//  Journal
//
//  Created by Carlo Gilmar on 3/18/18.
//  Copyright © 2018 Carlo Gilmar. All rights reserved.
//

import UIKit

class EntryList: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        tableView.dataSource = self
    }
    
}

extension EntryList: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
            let entry = EntryController.shared.getEntry(at: indexPath)
            cell.textLabel?.text = entry.title
            cell.detailTextLabel?.text = entry.body
            return cell
    }
    
}
