//
//  MenuTableViewController.swift
//  AljaleyaiOS
//
//  Created by Parth on 01/06/17.
//  Copyright © 2017 Parth Adroja. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class MenuTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    private let menuItems = ["Home", "About Us", "Contact Us"]

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
        } else if indexPath.row == 1 {
            openSafariViewController(with: "http://aljaleya.tv")
        } else {
            openMailComposer()
        }
    }

    func openSafariViewController(with url: String) {
        if let safeUrl = URL(string: url) {
            let controller = SFSafariViewController(url: safeUrl, entersReaderIfAvailable: true)
            present(controller, animated: true, completion: nil)
        }
    }

    func openMailComposer() {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        composeVC.setToRecipients(["info@aljaleya.ca"])
        composeVC.setSubject("Contact Support - iOS")
        composeVC.setMessageBody("", isHTML: false)
        self.present(composeVC, animated: true, completion: nil)
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
