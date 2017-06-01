//
//  ViewController.swift
//  AljaleyaiOS
//
//  Created by Parth Adroja on 20/05/17.
//  Copyright © 2017 Parth Adroja. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    private let videoUrl = URL(string: "http://207.35.21.69:1935/appletv/appletv/playlist.m3u8")
    
    @IBAction func aboutUSAction(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://aljaleya.tv")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func contactUSAction(_ sender: UIButton) {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["info@aljaleya.ca"])
        composeVC.setSubject("Contact Support - iOS")
        composeVC.setMessageBody("", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AVPlayerViewController
            destination.player = AVPlayer(url: videoUrl!)
    }

}

