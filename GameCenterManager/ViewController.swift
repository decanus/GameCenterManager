//
//  ViewController.swift
//  GameCenterManager
//
//  Created by Dean Eigenmann on 23.11.16.
//  Copyright © 2016 Dean Eigenmann. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    var gameCenterManager: GameCenterManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        gameCenterManager = GameCenterManager()
        gameCenterManager.delegate = self
        gameCenterManager.authenticatePlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: GameCenterManagerDelegate {

    func gameCenterManager(_ gameCenterManager: GameCenterManager, presentViewController viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }

    func gameCenterManager(_ gameCenterManager: GameCenterManager, localPlayerCouldNotBeAuthenticated error: Error) {
        print("\(error)")
    }

    func gameCenterManager(_ gameCenterManager: GameCenterManager, localPlayerIsAuthenticated localPlayer: GKLocalPlayer) {

    }

}
