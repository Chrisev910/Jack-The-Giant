//
//  Player.swift
//  Jack The Giant
//
//  Created by Chris Hammond on 30/07/2020.
//  Copyright © 2020 Chris Hammond. All rights reserved.
//

import SpriteKit

struct ColliderType {
    static let Player: UInt32 = 0;
    static let Cloud: UInt32 = 1;
    static let DarkCloudAndCollectibles: UInt32 = 2;
}

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
        
        
        //Add physics body to player for collision detection and collectables and also apply gravity.
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 50, height: self.size.height - 5));
        self.physicsBody?.affectedByGravity = true;
        //stop falling off with rotation
        self.physicsBody?.allowsRotation = false;
        self.physicsBody?.restitution = 0;
        self.physicsBody?.categoryBitMask = ColliderType.Player;
        self.physicsBody?.collisionBitMask = ColliderType.Cloud;
        self.physicsBody?.contactTestBitMask = ColliderType.DarkCloudAndCollectibles;
        
        
        
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
            self.position.x -= 7;
        } else {
            self.position.x += 7;
        }
        
    }
    
}
