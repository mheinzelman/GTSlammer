//
//  Scene.swift
//  GTSlammer
//
//  Created by Max Heinzelman on 12/30/18.
//  Copyright © 2018 Max Heinzelman. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

class Scene: SKScene {
    var contentCreated = false
    var mainSprite: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        if self.contentCreated == false {
            self.createSceneContents()
            self.contentCreated = true
        }
    }
    
    func createSceneContents() {
        //makes the background color blue
        self.backgroundColor = SKColor.blue
        
        //add main fish sprite
        self.mainSprite = SKSpriteNode(imageNamed: "GT1-3")
        self.mainSprite.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.addChild(self.mainSprite)
        
        //add dpad
        let dpap = DPad(spriteToMove: mainSprite, max_x_val: self.frame.size.width, max_y_val: self.frame.size.height)
        dpap.position = CGPoint(x: 74.6, y: 74.6)
        self.addChild(dpap)
        
        //add eat button
        let eatButton = EatButton(sprite: mainSprite)
        eatButton.position = CGPoint(x: self.frame.size.width - 70, y: 20)
        self.addChild(eatButton)
        
        //sets how the view will be scaled for different devices
        self.scaleMode = SKSceneScaleMode.aspectFit
    }
}
