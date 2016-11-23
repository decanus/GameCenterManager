//
//  GameCenterManager.swift
//  GameCenterManager
//
//  Created by Dean Eigenmann on 23.11.16.
//  Copyright © 2016 Dean Eigenmann. All rights reserved.
//

import GameKit

protocol GameCenterManagerDelegate: class {

    func gameCenterManager(_ gameCenterManager: GameCenterManager, presentViewController viewController: UIViewController)

    func gameCenterManager(_ gameCenterManager: GameCenterManager, localPlayerIsAuthenticated localPlayer: GKLocalPlayer)

    func gameCenterManager(_ gameCenterManager: GameCenterManager, localPlayerCouldNotBeAuthenticated error: Error)

}

class GameCenterManager {

    weak var delegate: GameCenterManagerDelegate?

    func authenticatePlayer() {

        GKLocalPlayer.localPlayer().authenticateHandler = { (viewController, error) in

            if GKLocalPlayer.localPlayer().isAuthenticated {
                return (self.delegate?.gameCenterManager(self, localPlayerIsAuthenticated: GKLocalPlayer.localPlayer()))!
            }

            if viewController != nil {
                return (self.delegate?.gameCenterManager(self, presentViewController: viewController!))!
            }

            self.delegate?.gameCenterManager(self, localPlayerCouldNotBeAuthenticated: error!)
        }
        
    }
}
