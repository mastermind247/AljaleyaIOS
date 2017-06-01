//
//  ContentViewController.swift
//  AljaleyaiOS
//
//  Created by Parth on 01/06/17.
//  Copyright © 2017 Parth Adroja. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SideMenu

class ContentViewController: UIViewController {

    private let videoUrl = URL(string: "http://207.35.21.69:1935/appletv/appletv/playlist.m3u8")!

    override func viewDidLoad() {
        super.viewDidLoad()

        SideMenuManager.menuPresentMode = .menuSlideIn
        SideMenuManager.menuFadeStatusBar = false
        SideMenuManager.menuAnimationTransformScaleFactor = 2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAction(_ sender: UIButton) {
        let playerController = AVPlayerViewController()
        playerController.player = AVPlayer(url: videoUrl)
        self.present(playerController, animated: true, completion: nil)
        playerController.view.frame = self.view.frame
        playerController.player?.play()
    }
}
