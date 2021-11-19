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
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
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
    var arrayCounter = 8
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let highScoreMemory = UserDefaults.standard.object(forKey: "highscore")
        if highScoreMemory != nil {
            highScoreLabel.text = "Highscore: \(highScoreMemory!)"
        }
        
        
        kennysHidden()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        timeCount = 10
        
        
        
        
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
        
        if timeCount == 0 {
            
            //          Alert
            
            let alert = UIAlertController(title: "Time is Over", message: "Do you want replay?", preferredStyle: UIAlertController.Style.alert)
            let yesButton = UIAlertAction(title: "yes", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!) in self.timeCount = 10; self.score = 0})
            alert.addAction(yesButton)
            self.present(alert, animated: true, completion: nil)
            }
        
    }

    @objc func caught() {
        if timeCount > 0 {
            score += 1
        }
        
        
        scoreLabel.text = "Score: \(score)"
        
        if timeCount == 0 {
//          Highscore
            if score > highScore {
                highScore = score
            
                let highscoredMemory: Void =  UserDefaults.standard.set(highScore, forKey: "highscore")
            }
            else if score >= highScore {
                highScoreLabel.text = "Highscore: \(highScore)"
            }

        }
    }
    
    
    func kennysHidden() {
        while arrayCounter >= 0  {
            let imageViewArray = [ imageView, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8, imageView9]
            let gestureRecornizer = UITapGestureRecognizer(target: self, action: #selector(caught))
            imageViewArray[arrayCounter]?.isUserInteractionEnabled = true
            imageViewArray[arrayCounter]?.addGestureRecognizer(gestureRecornizer)
            arrayCounter -= 1
        }
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
