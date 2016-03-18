//
//  ViewController.swift
//  Calculator
//
//  Created by BryantWu on 2016/3/16.
//  Copyright © 2016年 Bryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var core: Core<Float>!
    
    func resetCore(){
        self.core=Core()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCore()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var displaylabel: DisplayLabel!

    @IBAction func NumberPressed(sender: UIButton) {
        guard displaylabel.text!.characters.count < 11 else {
            return
        }
        if sender.tag >= 1000 && sender.tag < 1010 {
            displaylabel.append(sender.tag-1000)
        }
        else {
            displaylabel.append(0)
            displaylabel.append(0)
        }
        
    }
    @IBAction func ACButtonClicked(sender: UIButton) {
        displaylabel.clear()
        resetCore()
    }
    
    @IBAction func ChangeSignClicked(sender: UIButton) {
        displaylabel.changeSign()
    }
    @IBAction func OperatorClicked(sender: UIButton) {
        try! self.core.addStep(self.displaylabel.floatValue)
        switch (sender.titleForState(.Normal)!) {
        case "+":
            try! self.core.addStep(+)
        case "-":
            try! self.core.addStep(-)
        case "*":
            try! self.core.addStep(*)
        case "/":
            try! self.core.addStep(/)
        default:
            break
        }
        displaylabel.clear()
    }
    @IBAction func CalculateClicked(sender: AnyObject) {
        try! self.core.addStep(self.displaylabel.floatValue)
        self.displaylabel.floatValue = try! self.core.calculate()
        self.resetCore()
    }
}

