//
//  Player.swift
//  Jack The Giant
//
//  Created by Chris Hammond on 30/07/2020.
//  Copyright © 2020 Chris Hammond. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var textureAtlas = SKTextureAtlas();
    private var playerAnimation = [SKTexture]();
    private var animatePlayerAction = SKAction();
    
    func initializePlayerAndAnimations() {
        
        textureAtlas = SKTextureAtlas(named: "Player.atlas");
        
        for i in 2...textureAtlas.textureNames.count {
            let name = "Player \(i)";
            playerAnimation.append(SKTexture(imageNamed: name));
            
        }
        
        animatePlayerAction = SKAction.animate(with: playerAnimation, timePerFrame: 0.08, resize: true, restore: false);
    }
    
    func animatePlayer(moveLeft: Bool) {
        
        if moveLeft {
            self.xScale = -abs(self.xScale);
        } else {
            self.xScale = abs(self.xScale);
        }
        
        self.run(SKAction.repeatForever(animatePlayerAction), withKey: "Animate");
        
    }
    
    func stopPlayerAnimation() {
        self.removeAction(forKey: "Animate");
        self.texture = SKTexture(imageNamed: "Player 1");
        self.size = (self.texture?.size())!;
        
        
    }
    
    func movePlayer(moveLeft: Bool) {
        
        if moveLeft {
            self.position.x = self.position.x - 7;
        } else {
            self.position.x = self.position.x + 7;
        }
        
    }
    
}
