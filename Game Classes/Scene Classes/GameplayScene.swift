//
//  GameplayScene.swift
//  Jack The Giant
//
//  Created by Chris Hammond on 30/07/2020.
//  Copyright © 2020 Chris Hammond. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    
    var player: Player?;
    var canMove = false;
    var moveLeft = false;
    var center: CGFloat?;
    
    override func didMove(to view: SKView) {
        center = (self.scene?.size.width)! / (self.scene?.size.height)!;
        
        player = self.childNode(withName: "Player") as? Player;
        player?.initializePlayerAndAnimations();
        
        
    }
    override func update(_ currentTime: TimeInterval) {
        managePlayer();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self);
            
            if location.x > (center)! {
                moveLeft = false;
                player?.animatePlayer(moveLeft: moveLeft);
            } else {
                moveLeft = true;
                player?.animatePlayer(moveLeft: moveLeft);
            }
        }
        
        canMove = true;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false;
        player?.stopPlayerAnimation();
    }
    
    func managePlayer() {
        if canMove {
            player?.movePlayer(moveLeft: moveLeft);
        }
    }
}




































