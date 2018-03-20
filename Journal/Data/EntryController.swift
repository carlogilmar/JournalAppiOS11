//
//  EntryController.swift
//  Journal
//
//  Created by Carlo Gilmar on 3/18/18.
//  Copyright © 2018 Carlo Gilmar. All rights reserved.
//

import UIKit

class EntryController{
    
    static let shared = EntryController()
    
    var entries:[Entry] = []
    var tags:[String] {
        var tags = Set<String>()
        entries.forEach {
            tags.update(with: $0.tag.capitalized)
        }
        return Array(tags).sorted()
    }
    
    init(){
        
        let entry1 = Entry(title: "My Entry 1 can u see me?", body: "this is my 1 entry", tag: "Journal", color: .lightGray)
        let entry2 = Entry(title: "My Entry 2", body: "this is my 2 entry", tag: "Journal", color: .lightGray)
        let entry3 = Entry(title: "My Entry 3", body: "this is my 3 entry", tag: "Journal", color: .lightGray)
        let entry4 = Entry(title: "My Entry 4", body: "this is my 4 entry", tag: "Journal", color: .lightGray)
        let entry5 = Entry(title: "My Entry 5", body: "this is my 5 entry", tag: "Journal", color: .lightGray)
        entries = [entry1, entry2, entry3, entry4, entry5]

    }
    
    // CRUD
    
    func createEntry(withTitle title:String, body:String, tag:String?=nil, color:UIColor){
        let entry = Entry(title: title, body: body, tag: tag ?? "Untagged Wrapped", color: color)
        entries.append(entry)
    }
    
    func getEntry(at indexPath: IndexPath)-> Entry{
        let tag = tags[indexPath.section]
        let entries = getEntries(with: tag)
        return entries[indexPath.row]
    }

    
    func getEntries(with tag: String) -> [Entry]{
        return entries.filter { $0.tag == tag }
    }
    
    func updateEntry(_ entry: Entry, with title: String, body: String, tag: String? = nil, color:UIColor){
        guard let index = entries.index(of: entry) else { return }
        entries[index].title = title
        entries[index].body = body
        entries[index].tag = tag ?? "Untagged"
        entries[index].color = color
    }
    
    func deleteEntry(_ entry: Entry){
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
    }
}
