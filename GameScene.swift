//
//  GameScene.swift
//  TEST3
//
//  Created by Akshdeep Kaur on 2019-06-19.
//  Copyright © 2019 Akshdeep Kaur. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var nextLevelButton:SKLabelNode!
    let player = SKSpriteNode(imageNamed: "frame1")
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        player.position  = CGPoint(x: 400, y: 300)
        
        addChild(player)
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.player.position.x = self.player.position.x + self.xd * 10
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.player.position.x <= 50) {
            // left of screen
            self.xd = self.xd * -1
        }
        else if (self.player.position.x >= self.size.width-100) {
            // right of screen
            self.xd = self.xd * -1
        }
        else if (self.player.position.y <= 50) {
            // botttom of screen
            self.yd = self.yd * -1
        }
        else if (self.player.position.y >= self.size.height-100)  {
            // top of screen
            self.yd = self.yd * -1
        }
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        
        
        // MARK: Switch Levels
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
    }
}
