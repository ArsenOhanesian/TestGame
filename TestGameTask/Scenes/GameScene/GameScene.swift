//
//  GameScene.swift
//  TestGameTask
//
//  Created by csd_setup on 25.08.2024.
//

import SpriteKit
import GameplayKit


final class GameScene: SKScene {
    // MARK: - Properties
    //Nodes
    private var player = PlayerNode()
    
    private var coin: CoinNode!
    private var lightnings : LightningNode!
    private var booster: BoosterNode!
    private var progressBar: ProgressBarNode!
    private var cameraNode: CameraNode!
    private var hud: HudNode!
    
    // Time
    private var lastUpdateTime: TimeInterval = 0.0
    private var deltaTime: TimeInterval = 0.0
    
    // Game Variables
    private var life: Int = 3
    private var score: Int = UserDefaults.standard.integer(forKey: "coins")
    private var timer: Timer = Timer()
    private var seconds = 30
    
    private var cameraRect: CGRect {
        let width = size.width
        let height = size.height
        let x = cameraNode.position.x - size.width / 2.0 + ( size.width - width ) / 2.0
        let y = cameraNode.position.y - size.height / 2.0 + ( size.height - height ) / 2.0
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    // MARK: - Systems
    
    override func didMove(to view: SKView) {
        setupNodes()
    }
    
    override func update(_ currentTime: TimeInterval) {
        deltaTime = lastUpdateTime > 0 ? currentTime - lastUpdateTime : 0
        lastUpdateTime = currentTime
        moveCamera()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        player.isFlying.toggle()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        player.isFlying.toggle()
    }
    
    
}

// MARK: - Configurations

private extension GameScene{
     
    func setupNodes(){
        createBg()
        createPlayer()
        spawnItems()
        setupPhysic()
        setupCamera()
        startTimer()
    }
    
    func startTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, 
                                     block: { [weak self] timer in
            guard let self else { return }
            seconds -= 1
            cameraNode.update(.progress, value: -1)
            
            if seconds <= 0 {
                setGameOver(with: "Time is up")
            }
        })
    }
    
    func setupPhysic(){
        physicsWorld.contactDelegate = self
    }
    
    func moveCamera(){
        let amountToMove = cameraNode.movePointPerSecond * CGFloat(deltaTime)
        cameraNode.moveCamera(amount: amountToMove)
        player.move(amount: amountToMove)
        
        enumerateChildNodes(withName: "Background") { [weak self] node, _ in
            guard let self, let node = node as? BackgroundNode else { return }
            node.moveForCamera(camera: cameraRect)
        }
    }
    
    func setGameOver(with reason: String){
        timer.invalidate()
        presentGameOver(with: reason)
    }
    
    func presentGameOver(with reason: String){
        guard let view = view else { return }
        UserDefaults.standard.set(score, forKey: "coins")
        let scene = GameOverScene(reason: reason, size: self.size)
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
    }
    
    // MARK: - Create Nodes
    func createBg(){
        for i in 0...1{
            let background = BackgroundNode(index: i)
            background.name = "Background"
            addChild(background)
        }
    }
    
    func setupCamera(){
        cameraNode = CameraNode(windowFrame: frame)
        addChild(cameraNode)
        camera = cameraNode
    }
    
    func createPlayer(){
        player.name = "Player"
        addChild(player)
    }
    
    func createItem(_ itemType: ItemType){
        var node: BaseSpriteNode
        switch itemType {
        case .coin:
            node = CoinNode()
        case .lighting:
            node = LightningNode()
        case .booster:
            node = BoosterNode()
        }
        
        node.setPosition(windowSize: size, cameraRect: cameraRect)
        addChild(node)
    }
    
    func spawnItems(){
        let random = CGFloat.random(min: 1.5, max: 3.5)
        run(.repeatForever(.sequence([
            .wait(forDuration: random),
            .run { [weak self] in
                guard let self else { return }
                createItem(.coin)
                createItem(.lighting)
                createItem(.booster)
            }
        ])))
    }
    
    // MARK: - Contact Actions
    
    func contactWith(node: SKNode?, type: ItemType){
        guard let node else { return }
        node.removeFromParent()
        
        switch type {
            case .coin:
                contactWithCoin()
            case .lighting:
                contactWithLighting()
            case .booster:
                contactWithBooster()
        }
    }
    
    func contactWithLighting(){
        life -= 1
        cameraNode.update(.life)
        
        if life <= 0 {
            life = 0
            setGameOver(with: "Life is over")
        }
    }
    
    func contactWithCoin(){
        score += 1
        cameraNode.update(.score)
    }
    
    func contactWithBooster(){
        seconds += 5
        cameraNode.update(.progress, value: 5)
        if seconds >= 30 {
            seconds = 30
        }
    }
}


// MARK: - SKPhysicsContactDelegate
extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {
        let other = contact.bodyA.categoryBitMask == Res.PhysicCategories.player ? contact.bodyB : contact.bodyA
        
        switch other.categoryBitMask{
            case Res.PhysicCategories.lightning:
                contactWith(node: other.node, type: .lighting)
            case Res.PhysicCategories.coin:
                contactWith(node: other.node, type: .coin)
            case Res.PhysicCategories.booster:
                contactWith(node: other.node, type: .booster)
            default: break
        }
    }
}
