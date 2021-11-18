//
//  ViewController.swift
//  KennyGame
//
//  Created by Ahmed Hajıyev on 17.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    var score = 0
    var timer = Timer()
    var timeCount = 0
    var highScore = 0
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let highScoreMemory = UserDefaults.standard.object(forKey: "highscore")
        
        
        kennysHidden()
        
        imageView.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        imageView4.isUserInteractionEnabled = true
        imageView5.isUserInteractionEnabled = true
        imageView6.isUserInteractionEnabled = true
        imageView7.isUserInteractionEnabled = true
        imageView8.isUserInteractionEnabled = true
        imageView9.isUserInteractionEnabled = true
        let gestureRecornizer1 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer2 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer3 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer4 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer5 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer6 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer7 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer8 = UITapGestureRecognizer(target: self, action: #selector(caught))
        let gestureRecornizer9 = UITapGestureRecognizer(target: self, action: #selector(caught))
        imageView.addGestureRecognizer(gestureRecornizer1)
        imageView2.addGestureRecognizer(gestureRecornizer2)
        imageView3.addGestureRecognizer(gestureRecornizer3)
        imageView4.addGestureRecognizer(gestureRecornizer4)
        imageView5.addGestureRecognizer(gestureRecornizer5)
        imageView6.addGestureRecognizer(gestureRecornizer6)
        imageView7.addGestureRecognizer(gestureRecornizer7)
        imageView8.addGestureRecognizer(gestureRecornizer8)
        imageView9.addGestureRecognizer(gestureRecornizer9)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        timeCount = 10
       
        
        
        if highScore < score {
            highScore = score
            highScoreLabel.text = "Highscore: \(highScoreMemory)"
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    

    @objc func timerFunc() {
        let imageViewArray = [ imageView, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8, imageView9]
        
        timeLabel.text = "Time: \(timeCount)"
        if timeCount > 0  {
            kennysHidden()
            let randomNum = Int.random(in: 0..<9)
            imageViewArray[randomNum]!.isHidden = false
            
            print(randomNum)
            timeCount -= 1
            
        }
        
        
        
//        if timeCount == 0 {
//            timeLabel.text = "Time is Over"
//            let alert = UIAlertController(title: "Time is over", message: "Your time is over. Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
//            let yesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in self.isActive = true} )
//            let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in self.isActive = false})
//            alert.addAction(yesButton)
//            alert.addAction(noButton)
//            self.present(alert, animated: true, completion: nil)
//
//            if isActive == true {
//                timeCount = 10
//            }
//            if isActive == false {
//
//            }
//        }
    }

    @objc func caught() {
        if timeCount > 0 {
            score += 1
        }
        
        
        scoreLabel.text = "Score: \(score)"
        if timeCount == 0 {
            highScore = score
            highScoreLabel.text = "Highscore: \(highScore)"
            let highscored =  UserDefaults.standard.set(highScore, forKey: "highscore")
            
            
        }
        
        
    }
    
    func kennysHidden() {
        imageView.isHidden = true
        imageView2.isHidden = true
        imageView3.isHidden = true
        imageView4.isHidden = true
        imageView5.isHidden = true
        imageView6.isHidden = true
        imageView7.isHidden = true
        imageView8.isHidden = true
        imageView9.isHidden = true
    }
    
    

    
    
    
    
}
