//
//  ViewController.swift
//  TabataTimer
//
//  Created by jiu-mpr on 2014. 7. 13..
//  Copyright (c) 2014 jiu-mpr. All rights reserved.
//

import UIKit

class TabataTimerViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var isExerciseStateLabel: UILabel!
    @IBOutlet var labelBackground: UIImageView!
    @IBOutlet var blink: UIImageView!

    var sec:Int = 0
    var centiseconds:Int = 0 {
    didSet {
        var milliSecond2d:Int = (centiseconds % 100)
        sec = centiseconds / 100
        var minuite:Int = sec / 60
        var second:Int = sec % 60

        if centiseconds == 0 {
            self.isExerciseStateLabel.text = "준비"
            self.labelBackground.image = UIImage(named: "bg0")
        } else if isExercise(centiseconds) {
            self.isExerciseStateLabel.text = "운동 중"
            self.labelBackground.image = UIImage(named: "bg3")
        } else {
            self.isExerciseStateLabel.text = "휴식 중"
            self.labelBackground.image = UIImage(named: "bg2")
        }
        
        self.timeLabel.text = NSString(format: "%.2d:%.2d:%.2d",minuite, second, milliSecond2d)
    }
    

    }
   
    func isExercise(sec:Int) -> Bool {
        var exerciseTrue = true
        
        if (sec % (30 * 100)) <= 20 * 100 {
            exerciseTrue = true
        } else {
            exerciseTrue = false
        }
        
        return exerciseTrue
    }
    
    var timer:NSTimer?
    @IBAction func buttonTapped(sender: UIButton) {
        if sender.selected {
            //stop
            self.timer!.invalidate()
            self.timer = nil
            self.centiseconds = 0
        } else {
            //start
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("secondpassed:"), userInfo: nil, repeats: true)
            
        }
        sender.selected = !sender.selected
    }
    
    
    
    func secondpassed(sender:NSTimer) {
        centiseconds++

    }
    
   
}

