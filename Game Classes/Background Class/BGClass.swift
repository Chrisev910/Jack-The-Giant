//
//  BGClass.swift
//  Jack The Giant
//
//  Created by Chris Hammond on 31/07/2020.
//  Copyright © 2020 Chris Hammond. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode {
    
    func moveBG(camera: SKCameraNode)
    {
        if self.position.y - self.size.height - 10 > camera.position.y {
            self.position.y -= self.size.height * 3;
        }
    }
    
}
