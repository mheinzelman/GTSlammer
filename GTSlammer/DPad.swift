//
//  DPad.swift
//  GTSlammer
//
//  Created by Max Heinzelman on 12/31/18.
//  Copyright © 2018 Max Heinzelman. All rights reserved.
//

import SpriteKit

class DPad: SKNode {
    var up: SKShapeNode
    var down: SKShapeNode
    var left: SKShapeNode
    var right: SKShapeNode
    
    var spriteToMove: SKSpriteNode
    var max_x_val: CGFloat
    var max_y_val: CGFloat
    
    
    init(spriteToMove: SKSpriteNode, max_x_val: CGFloat, max_y_val: CGFloat) {
        //initialize the member vars
        self.up = SKShapeNode()
        self.down = SKShapeNode()
        self.left = SKShapeNode()
        self.right = SKShapeNode()
        
        self.spriteToMove = spriteToMove
        self.max_x_val = max_x_val
        self.max_y_val = max_y_val
        
        super.init()
        
        //create each triangle
        createUpTriangle(node: self.up)
        createDownTriangle(node: self.down)
        createLeftTriangle(node: self.left)
        createRightTriangle(node: self.right)
        
        isUserInteractionEnabled = true
    }
    
    func createUpTriangle(node: SKShapeNode) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 34.6))
        path.addLine(to: CGPoint(x: -20.0, y: 0.0))
        path.addLine(to: CGPoint(x: 20, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: 34.6))
        
        node.path = path.cgPath
        node.fillColor = UIColor.clear
        
        //add the node to the scene
        node.position = CGPoint(x: 0.0, y: 25.0)
        self.addChild(node)
    }
    
    func createDownTriangle(node: SKShapeNode) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: -34.6))
        path.addLine(to: CGPoint(x: -20.0, y: 0.0))
        path.addLine(to: CGPoint(x: 20, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: -34.6))
        
        node.path = path.cgPath
        node.fillColor = UIColor.clear
        
        //add the node to the scene
        node.position = CGPoint(x: 0.0, y: -25.0)
        self.addChild(node)
    }
    
    func createLeftTriangle(node: SKShapeNode) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -34.6, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: 20.0))
        path.addLine(to: CGPoint(x: 0.0, y: -20.0))
        path.addLine(to: CGPoint(x: -34.6, y: 0.0))
        
        node.path = path.cgPath
        node.fillColor = UIColor.clear
        
        //add the node to the scene
        node.position = CGPoint(x: -25.0, y: 0.0)
        self.addChild(node)
    }
    
    func createRightTriangle(node: SKShapeNode) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 34.6, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: 20.0))
        path.addLine(to: CGPoint(x: 0.0, y: -20.0))
        path.addLine(to: CGPoint(x: 34.6, y: 0.0))
        
        node.path = path.cgPath
        node.fillColor = UIColor.clear
        
        //add the node to the scene
        node.position = CGPoint(x: 25.0, y: 0.0)
        self.addChild(node)
    }
    
    func touch(touches: Set<UITouch>) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if up.contains(location) {
                y_movement(direction: 5.0)
            }
            else if down.contains(location) {
                y_movement(direction: -5.0)
            }
            else if left.contains(location) {
                x_movement(direction: -5.0)
            }
            else if right.contains(location) {
                x_movement(direction: 5.0)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.spriteToMove.removeAction(forKey: "x")
        self.spriteToMove.removeAction(forKey: "y")
        
        touch(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.spriteToMove.removeAction(forKey: "x")
        self.spriteToMove.removeAction(forKey: "y")
    }
    

    func x_movement(direction: CGFloat) {
        let movement = SKAction.customAction(withDuration: 5.0) { node, elapsedTime in
            if node.position.x + direction > 0 && node.position.x + direction < self.max_x_val {
                node.position.x = node.position.x + direction
            }
        }
        let moveForever = SKAction.repeatForever(movement)
        spriteToMove.run(moveForever, withKey: "x")
    }
    
    func y_movement(direction: CGFloat) {
        let movement = SKAction.customAction(withDuration: 5.0) { node, elapsedTime in
            if node.position.y + direction > 0 && node.position.y + direction < self.max_y_val {
                node.position.y = node.position.y + direction
            }
        }
        
        let moveForever = SKAction.repeatForever(movement)
        spriteToMove.run(moveForever, withKey: "y")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
