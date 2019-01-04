//
//  EatButton.swift
//  GTSlammer
//
//  Created by Max Heinzelman on 1/3/19.
//  Copyright © 2019 Max Heinzelman. All rights reserved.
//

import SpriteKit

class EatButton: SKNode {
    var eat: SKShapeNode
    var sprite: SKSpriteNode
    
    var isMouthOpen: Bool = false
    
    init(sprite: SKSpriteNode) {
        self.eat = SKShapeNode()
        self.sprite = sprite
        
        super.init()
        
        createEatButton(node: eat)
        isUserInteractionEnabled = true
    }
    
    func createEatButton(node: SKShapeNode) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: -50.0, y: 0.0))
        path.addLine(to: CGPoint(x: -50.0, y: 50.0))
        path.addLine(to: CGPoint(x: 50.0, y: 50.0))
        path.addLine(to: CGPoint(x: 50.0, y: 0.0))
        path.addLine(to: CGPoint(x: -50.0, y: 0.0))
        
        node.path = path.cgPath
        node.fillColor = UIColor.clear
        
        //add the node to the scene
        node.position = CGPoint(x: 0.0, y: 0.0)
        self.addChild(node)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            //if button is pressed change the image
            if self.eat.contains(location) {
                self.sprite.texture = SKTexture(imageNamed: "GT2-3")
                
                //set isMouthOpen to true
                self.isMouthOpen = true
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //change the sprite image back to non-eating fish
        if self.isMouthOpen == true {
            self.sprite.texture = SKTexture(imageNamed: "GT1-3")
            
            //now the mouth is closed, set isMouthOpen to false
            self.isMouthOpen = false
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
