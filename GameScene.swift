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
    let bottom = SKSpriteNode(imageNamed: "bottom")
    var xd:CGFloat = 0
    var yd:CGFloat = 0

    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        player.position  = CGPoint(x: 100, y: 1200)
        
        addChild(player)
       
    }
    func makeground(xPosition:CGFloat, yPosition:CGFloat, throwX:CGFloat, throwY:CGFloat) {
        
        // 1. create an ground sprite
        let ground = SKSpriteNode(imageNamed: "ground")
        
        // 2. set initial position of ground to be same
        // as where mouse is clicked
        ground.position.x = xPosition;
       ground.position.y = yPosition;
        
        // force ground to appear in foreground
        ground.zPosition = 99;
        
        
        // 3. set physics for the ground
        // -- dyanmic = true
        // -- gravity = true
        // Both are true by default
        ground.physicsBody = SKPhysicsBody(circleOfRadius: ground.size.width/2)
        
        
        // 4. Add the ground to the scene
        addChild(ground)
        
        
        
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
        
        
        
        if (player.intersects(bottom) == true) {
            print("player losses")
        }
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
