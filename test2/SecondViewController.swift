//
//  SecondViewController.swift
//  test2
//
//  Created by Rae  Lasko on 10/28/15.
//  Copyright © 2015 Rae  Lasko. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var arrayLabel: UILabel!
    
    
    //create type to record user selected actions
    enum Action {
        case LF, RF, LL, RL, S
    }
    
    //initiate variables
    
    //Holds sequence as it is being entered by user
    var actionsArray = [(action: Action, number: Int)]()
    
    //recieves data from ViewController. Determines function of mystery key
    var experimentRecieved:Int = 0
    
    var number:Int = 10
    
    //Checks that inputs are syntatically correct
    var lastButtonWasNumber:Bool = true
    
    var pandaArray = [
        UIImage(named: "panda1")!,
        UIImage(named: "panda2")!,
        UIImage(named: "panda3")!,
        UIImage(named: "panda4")!,
        UIImage(named: "panda5")!,
        UIImage(named: "panda6")!,
        UIImage(named: "panda7")!,
        UIImage(named: "panda8")!
    ]
    
    //Arrays of animation sequences
    var leftFlipArray = [
        UIImage(named: "leftFlip")!,
        UIImage(named: "blank")!
    ]
    var rightFlipArray = [
        UIImage(named: "rightFlip")!,
        UIImage(named: "blank")!
    ]
    var leftLeapArray = [
        UIImage(named: "leftLeap")!,
        UIImage(named: "blank")!
    ]
    var rightLeapArray = [
        UIImage(named: "rightLeap")!,
        UIImage(named: "blank")!
    ]
    var spinArray = [
        UIImage(named: "spin")!,
        UIImage(named: "blank")!
    ]
    
    //Assists in animating by holding the animation that should currently by animated
    var currentActionArray:[UIImage] = [
        UIImage(named: "panda1")!
    ]
    
    //Populated after Go is pressed. Actions and numbers removed from tuples in actionsArray
    var playActionArray: [Action] = []

    @IBOutlet weak var animationView: UIImageView!
    
    //if any of number button clicked, change var number
      @IBAction func didClickOne(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 1
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickTwo(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 2
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickThree(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 3
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickFour(sender: AnyObject) {
        if (!lastButtonWasNumber) {
            actionsArray[actionsArray.count-1].number = 4
        }
        lastButtonWasNumber = true
    }

    @IBAction func didClickFive(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 5
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSix(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 6
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickSeven(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 7
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickEight(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 8
        }
        lastButtonWasNumber = true
    }
    
    @IBAction func didClickNine(sender: AnyObject) {
        if lastButtonWasNumber == false{
            actionsArray[actionsArray.count-1].number = 9
        }
        lastButtonWasNumber = true
    }
    
    //if any action button clicked, change bool
    @IBAction func didClickLeftFlipButton(sender: AnyObject) {
        actionsArray.append((.LF,1))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightFlipButton(sender: AnyObject) {
        actionsArray.append((.RF,1))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickLeftLeapButton(sender: AnyObject) {
        actionsArray.append((.LL,1))
        lastButtonWasNumber = false
    }
    
    @IBAction func didClickRightLeapButton(sender: AnyObject) {
        actionsArray.append((.RL,1))
        lastButtonWasNumber = false
    }


    @IBAction func didClickSpinButton(sender: AnyObject) {
        actionsArray.append((.S,1))
        lastButtonWasNumber = false
    }

    
    //switch determines mystery funct.
    @IBAction func didClickMysteryButton(sender: AnyObject) {
        switch experimentRecieved{
            case 1:
                actionsArray += actionsArray
            
            case 2:
                for (_, var repeats) in actionsArray{
                    repeats = repeats*3
            }
            case 3:
                for (_, var repeats) in actionsArray{
                    repeats = repeats*10
            }
            case 4:
                for (_, var repeats) in actionsArray{
                    repeats = repeats*2
            }
            case 5:
                for (_, var repeats) in actionsArray{
                    repeats = repeats*2
            }
        default:
            animationView.image = UIImage(named: "panda1")
            
        }

        //handles exception - cannot select number after this button
        lastButtonWasNumber = true
    }
    

    
    //execute animation
    @IBAction func didClickGo(sender: AnyObject) {
        
        //appends actions to playActions array from actionsArray. Removes elements from tuples --> type action
        for (action,number) in actionsArray {
            for _ in 1...number {
            playActionArray.append(action)
            }
        }
        animateLabel();
        actionsArray = []

        
        //handles exception - sequence must begin with action
        lastButtonWasNumber = true
    }
    
    
    func animateLabel() {
        
        //When playActionArray is empty, stop the recursive calls
        guard !playActionArray.isEmpty else {
            return
        }
        
        //initialize currentAction to the first element in playActionArray
        let currentAction:Action = playActionArray.first!
        
        
        //Change the currentActionArray to the correct one based on the action that is denoted in playActionArray
        switch currentAction{
        case .LF:
            currentActionArray = leftFlipArray
        case .RF:
            currentActionArray = rightFlipArray
        case .LL:
            currentActionArray = leftLeapArray
        case .RL:
            currentActionArray = rightLeapArray
        case .S:
            currentActionArray = spinArray
        }
        
        
        //Play animation from playActionArray
        //currentActionArray contains the array of the animation sequence that is currently playing
        //Recursively callse animateLabel() until playActionArray is empty
        UIView.transitionWithView(animationView, duration: 2.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self.animationView.image = self.currentActionArray[0]
            }) { (completion) -> Void in
                    self.animationView.image = self.currentActionArray[1]
                    self.playActionArray.removeFirst()
                    self.animateLabel()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
