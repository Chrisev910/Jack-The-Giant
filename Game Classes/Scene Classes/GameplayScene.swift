//
//  GameplayScene.swift
//  Jack The Giant
//
//  Created by Chris Hammond on 30/07/2020.
//  Copyright © 2020 Chris Hammond. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    
    var cloudsController = CloudsController();
    
    var mainCamera: SKCameraNode?;
    
    var bg1: BGClass?;
    var bg2: BGClass?;
    var bg3: BGClass?;
    
    var player: Player?;
    
    var canMove = false;
    var moveLeft = false;
    
    var center: CGFloat?;
    
    private var cameraDistanceBeforeCreatingNewClouds = CGFloat();
    
    let distanceBetweenClouds = CGFloat(240);
    let minX = CGFloat(-160);
    let maxX = CGFloat(160);
    
    override func didMove(to view: SKView) {
        
        initializeVariables();
        
    }
    override func update(_ currentTime: TimeInterval) {
        
        moveCamera();
        managePlayer();
        manageBackgrounds();
        createNewClouds();
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
    
    func initializeVariables() {
        center = (self.scene?.size.width)! / (self.scene?.size.height)!;
        
        player = self.childNode(withName: "Player") as? Player;
        player?.initializePlayerAndAnimations();
        
        mainCamera = self.childNode(withName: "Main Camera") as? SKCameraNode;
        
        getBackgrounds();
        
        cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: true);
        
        cameraDistanceBeforeCreatingNewClouds = mainCamera!.position.y - 400;
        
        
        
    }
    
    func getBackgrounds() {
        bg1 = self.childNode(withName: "BG 1") as? BGClass;
        bg2 = self.childNode(withName: "BG 2") as? BGClass;
        bg3 = self.childNode(withName: "BG 3") as? BGClass;
        
    }
    
    func managePlayer() {
        if canMove {
            player?.movePlayer(moveLeft: moveLeft);
        }
    }
    
    func moveCamera() {
        self.mainCamera?.position.y -= 2;
        
    }
    
    func manageBackgrounds() {
        bg1?.moveBG(camera: mainCamera!);
        bg2?.moveBG(camera: mainCamera!);
        bg3?.moveBG(camera: mainCamera!);
    }
    
    func createNewClouds() {
        if cameraDistanceBeforeCreatingNewClouds > (mainCamera?.position.y)! {
            
            cameraDistanceBeforeCreatingNewClouds = mainCamera!.position.y - 400;
            
            cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: false);
        }
    }
}




































