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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EntryController.shared.tags.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return EntryController.shared.tags[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tag = EntryController.shared.tags[section]
        return EntryController.shared.getEntries(with: tag).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
            let entry = EntryController.shared.getEntry(at: indexPath)
            cell.textLabel?.text = entry.title
            cell.detailTextLabel?.text = entry.body
            return cell
    }
    
}
