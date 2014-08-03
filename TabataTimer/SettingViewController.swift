//
//  SettingViewController.swift
//  TabataTimer
//
//  Created by 정 우진 on 2014. 7. 20..
//  Copyright (c) 2014년 jiu-mpr. All rights reserved.
//

import UIKit

enum SettingCase: Int {
    case EXERCISE_TIME = 0, BREAK_TIME, REPETITION
};

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var promptView: UIAlertView?
    
    @IBAction func closeTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var CellIdentifier = "Cell Identifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        var itemLabel = cell.viewWithTag(1) as UILabel
        var valueLabel = cell.viewWithTag(2) as UILabel
        
        if let itemCase = SettingCase.fromRaw(indexPath.row) {
            switch itemCase {
            case SettingCase.EXERCISE_TIME:
                itemLabel.text = "운동 시간"
                
            case SettingCase.BREAK_TIME:
                itemLabel.text = "휴식 시간"
                
            case SettingCase.REPETITION:
                itemLabel.text = "반복 횟수"
                
            }
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        promptView = UIAlertView(title: "완료", message: "숫자를 입력하세요.", delegate: self, cancelButtonTitle: "취소", otherButtonTitles: "확인")
        promptView!.alertViewStyle = UIAlertViewStyle.PlainTextInput
        promptView!.textFieldAtIndex(0).keyboardType = UIKeyboardType.NumberPad
        promptView!.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 1) {
            var indexPath = tableView.indexPathForSelectedRow()
            var cell = tableView.cellForRowAtIndexPath(indexPath)
            var valueLabel = cell.viewWithTag(2) as UILabel
            valueLabel.text = alertView.textFieldAtIndex(0).text
        }
    }

}























