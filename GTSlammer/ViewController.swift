//
//  ViewController.swift
//  GTSlammer
//
//  Created by Max Heinzelman on 12/30/18.
//  Copyright © 2018 Max Heinzelman. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let spriteView = self.view as? SKView {
            //shows debugging information in the lower right corner
            spriteView.showsDrawCount = true
            spriteView.showsFPS = true
            spriteView.showsNodeCount = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        //create an instance of Scene
        let scene = Scene()
        scene.size = self.view.bounds.size
        
        //cast the scene to be a SKView then present it
        if let spriteView = self.view as? SKView {
            spriteView.presentScene(scene)
        }
    }
    
}

