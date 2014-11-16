//
//  Running.swift
//  CodeCamp02
//
//  Created by Dũng Bé O on 11/16/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class Running: UIViewController {

    
    var mario: UIImageView?
    var background1, background2, background3, background4, obstacle, obstacle2: UIImageView?
    var _timer: NSTimer?
    var viewHeight: Double = 0.0
    var moveX = 20
    let backgroundWidth: Double = 1500
    let backgroundHeight: Double = 600
    var velY: Double = 0.0
    var accY: Double = 14.0
    var y : Double = 0
    var x : CGFloat = 0
    var obstacleX : Double = 60
    var obstacleY : Double = 60
    var maxHeight: Double = 0.0
    var jumped : Bool = false
    var minHeight : Double = 450
    var tapNext : Bool = false
    var highJump : Bool = false
    var point : Int = 0
    var pointLabel : UILabel = UILabel()
    var gameOverLabel : UILabel = UILabel()
    var gameOverView : UIView!
    var gameOverY : Double = 0
    var imgListArray :NSMutableArray = []
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let viewSize = self.view.bounds.size
        viewHeight = Double(viewSize.height) - 60
        
        
        background1 = UIImageView(frame: CGRect(x: 0, y: viewHeight - backgroundHeight, width: backgroundWidth, height: backgroundHeight))
        background1!.image = UIImage(named: "background.png")
        self.view.addSubview(background1!)
        background4 = UIImageView(frame: CGRect(x: backgroundWidth, y: viewHeight - backgroundHeight, width: backgroundWidth, height: backgroundHeight))
        background4!.image = UIImage(named: "background.png")
        self.view.addSubview(background4!)
        
        obstacle = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        obstacle?.image = UIImage(named: "obstacle.png")
        obstacle!.center = CGPoint(x: viewSize.width , y: CGFloat(viewHeight) - 10 - CGFloat(obstacleY) * 0.5)
        obstacle2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        obstacle2?.image = UIImage(named: "obstacle.png")
        obstacle2!.center = CGPoint(x: viewSize.width - 20, y: CGFloat(viewHeight) - 10 - CGFloat(obstacleY) * 0.5)
        self.view.addSubview(obstacle!)
        
        gameOverView = UIView(frame: CGRect(x: 25 , y: -250, width: 400, height: 200))
        gameOverLabel = UILabel(frame: CGRect(x: 0 , y: 0, width: 150  , height: 80))
        gameOverLabel.center = CGPoint(x: gameOverView.bounds.size.width * 0.5, y: gameOverView.bounds.size.height * 0.5)
        gameOverLabel.text = "You Died!"
        gameOverLabel.backgroundColor = UIColor.yellowColor()
        gameOverLabel.textColor = UIColor.redColor()
        gameOverLabel.textAlignment = NSTextAlignment.Center
        gameOverView.addSubview(gameOverLabel)
        self.view.addSubview(gameOverView)
        
        
        pointLabel = UILabel(frame: CGRect(x: viewSize.width - 350, y: 50, width: 70, height: 30))
        pointLabel.text = "Point : 0"
        pointLabel.backgroundColor = UIColor.whiteColor()
        pointLabel.textColor = UIColor.blackColor()
        self.view.addSubview(pointLabel)
        
        gameOverLabel = UILabel(frame: CGRect(x: viewSize.width - 200, y: 50, width: 250, height: 250))
        
        mario = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 150))
        mario?.center = CGPoint(x: viewSize.width * 0.5 - 130, y: CGFloat(viewHeight) - 10 - mario!.bounds.size.height * 0.5)
        mario!.userInteractionEnabled = true
        mario!.multipleTouchEnabled = true
        for countValue in 1...6
        {
            
            var strImageName : String = "\(countValue).png"
            var image  = UIImage(named:strImageName)
            imgListArray .addObject(image!)
        }
        mario!.animationImages = imgListArray
        mario!.animationDuration = 1.0
        
        self.view.addSubview(mario!)
        mario!.startAnimating()
        maxHeight = viewHeight - 10 - Double(mario!.bounds.size.height) * 0.5
        x = viewSize.width * 0.5
        y = viewHeight - 10 - Double(mario!.bounds.size.height) * 0.5
        let tap = UITapGestureRecognizer(target: self, action: "tapOnMario")
        self.view.addGestureRecognizer(tap)
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runbackground", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func runbackground() {
        obstacle!.center = CGPoint(x: obstacle!.center.x - CGFloat(moveX), y: obstacle!.center.y)
        if obstacle!.frame.origin.x + 40 < 0 {
            obstacle!.frame = CGRect(x: Double(obstacle2!.frame.origin.x) + 40, y: Double(obstacle!.frame.origin.y), width: 100, height: 80)
            point++
            pointLabel.text = "Point: \(point)"
        }
        if obstacle2!.frame.origin.x + CGFloat(40) < 0 {
            obstacle2!.frame = CGRect(x: Double(obstacle!.frame.origin.x) + 40, y: Double(obstacle!.frame.origin.y), width: 100, height: 80)
            point++
            pointLabel.text = "Point: \(point)"
        }
        background1!.center = CGPoint(x: background1!.center.x - CGFloat(moveX), y: background1!.center.y)
        background4!.center = CGPoint(x: background4!.center.x - CGFloat(moveX), y: background4!.center.y)
        
        if background1!.frame.origin.x + CGFloat(backgroundWidth) < 0 {
            background1!.frame = CGRect(x: Double(background4!.frame.origin.x) + backgroundWidth, y: Double(background1!.frame.origin.y), width: backgroundWidth, height: backgroundHeight)
            println("move 1")
        }
        if background4!.frame.origin.x + CGFloat(backgroundWidth) < 0 {
            background4!.frame = CGRect(x: Double(background1!.frame.origin.x) + backgroundWidth, y: Double(background1!.frame.origin.y), width: backgroundWidth, height: backgroundHeight)
            println("move 2")
        }
        if ((mario!.center.x) < (obstacle!.center.x + 20) && (mario!.center.x) > (obstacle!.center.x - 20) && (mario!.center.y + 60) > (obstacle!.center.y - 20)){
            UIView.animateWithDuration(1.0, animations: {
                self.gameOverView.center = CGPoint(x: 200, y: 200)
                println("\(self.gameOverY)")
                },
                completion:{finished in
            })
            _timer?.invalidate()
            _timer = nil
            pointLabel.text = "Point: \(point)"
            mario?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI / 2))
            
            
        }
        if (jumped == true) {
            
            y -= accY
            
            if y < minHeight {
                accY *= -1
                y = minHeight
                
            }else if(y > maxHeight) {
                jumped = false
                accY *= -1
                y = maxHeight
            }
            
            mario?.center = CGPoint(x: Double(x) * 0.5, y: y)
            
        }
        
        
    }
    func tapOnMario() {
        jumped = true
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }

}
