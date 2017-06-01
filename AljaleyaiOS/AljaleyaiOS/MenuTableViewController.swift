//
//  MenuTableViewController.swift
//  AljaleyaiOS
//
//  Created by Parth on 01/06/17.
//  Copyright © 2017 Parth Adroja. All rights reserved.
//

import UIKit
import SafariServices

class MenuTableViewController: UITableViewController {

    private let menuItems = ["Home", "About Us"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            dismiss(animated: true, completion: nil)
        } else {
            openSafariViewController(with: "http://aljaleya.tv")
        }
    }

    func openSafariViewController(with url: String) {
        if let safeUrl = URL(string: url) {
            let controller = SFSafariViewController(url: safeUrl, entersReaderIfAvailable: true)
            present(controller, animated: true, completion: nil)
        }
    }
}
