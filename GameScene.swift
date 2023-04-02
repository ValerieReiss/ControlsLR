//
//  GameScene.swift
//  Left Right Controls
//
//  Created by Valerie on 30.03.23.
//

import SpriteKit
import GameplayKit

var player = SKSpriteNode(imageNamed: "Planisferius")
var backgroundColorCustom = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
var playerSize = CGSize(width: 10, height: 10)

let normalPlayerPositionX = 0

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.backgroundColor = backgroundColorCustom
        
        let links = SKShapeNode(circleOfRadius: 100)
        links.fillColor = .systemRed
        links.name = "links"
        links.zPosition = 6
        links.position = CGPoint(x: self.frame.midX-550, y: self.frame.midY-280)
        links.setScale(1)
        self.addChild(links)
        
        let rechts = SKShapeNode(circleOfRadius: 100)
        rechts.fillColor = .systemGreen
        rechts.name = "rechts"
        rechts.zPosition = 6
        rechts.position = CGPoint(x: self.frame.midX+550, y: self.frame.midY-280)
        rechts.setScale(1)
        self.addChild(rechts)
        
        spawnPlayer()
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
           
            let node = self.atPoint(location)

            if (node.name == "links") {
                let bla = SKAction.moveTo(x: player.position.x-100, duration: 0.3)
                bla.timingFunction = {
                    time in return simd_smoothstep(0, 1, time)
                }
                let blub = SKAction.moveTo(x: CGFloat(normalPlayerPositionX), duration: 2.0)
                blub.timingFunction = {
                    time in return simd_smoothstep(0, 1, time)
                }
                let sequence = SKAction.sequence([bla, blub])
                player.run(sequence)
            } else if (node.name == "rechts") {
                let bla = SKAction.moveTo(x: player.position.x+100, duration: 0.3)
                bla.timingFunction = {
                    time in return simd_smoothstep(0, 1, time)
                }
                let blub = SKAction.moveTo(x: CGFloat(normalPlayerPositionX), duration: 2.0)
                blub.timingFunction = {
                    time in return simd_smoothstep(0, 1, time)
                }
                let sequence = SKAction.sequence([bla, blub])
                player.run(sequence)
            }
            
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
            
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
               
           }

    
    func spawnPlayer(){
        player.setScale(0.1)
        player.name = "player"
        player.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.isDynamic = true
        player.position = CGPointMake(self.frame.midX, self.frame.midY)
        self.addChild(player)
    }
    
}
