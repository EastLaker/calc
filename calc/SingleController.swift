//
//  ViewController.swift
//  calc
//
//  Created by MyVirtualMac on 2019/2/21.
//  Copyright © 2019 Ulysses Chen. All rights reserved.
//

import UIKit


class SingleController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    var preData:Double = 0
    var myoperator:String?
    var backwardsString:String?
    var dotflag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func OnNumButtonPressed(_ sender: UIButton) {
        let text = sender.currentTitle!
        if labelOutlet.text == nil {
            labelOutlet.text = sender.currentTitle!
        } else {
            if text == "." {
                if dotflag == true {
                    return
                } else {
                    dotflag = true
                }
            }
            labelOutlet.text?.append(contentsOf: text)
        }
        
    }
    
    @IBAction func OnOperatorPressed(_ sender: UIButton) {
        if labelOutlet.text == nil || labelOutlet.text == "" {
            return
        } else {
            preData = Double(labelOutlet.text!)!
            switch sender.currentTitle {
            case "+":
                labelOutlet.text = ""
                myoperator = "+"
                dotflag = false
            case "-":
                dotflag = false
                labelOutlet.text = ""
                myoperator = "-"
            case "x":
                dotflag = false
                labelOutlet.text = ""
                myoperator = "x"
            case "÷":
                dotflag = false
                labelOutlet.text = ""
                myoperator = "/"
            default:
                break
            }
        }
    }
    @IBAction func OnBackButtonPressed(_ sender: UIButton) {
        if labelOutlet.text == nil || labelOutlet.text == "" {
            return
        } else {
            if labelOutlet.text?.last == "." {
                dotflag = false
            }
                labelOutlet.text?.removeLast()
        }
    }
    
    @IBAction func SolutionButtonPressed(_ sender: UIButton) {
        if labelOutlet.text == nil || labelOutlet.text == "" {
            return
        } else {
            let num2 = Double(labelOutlet.text!)!
            var result:Float
            switch myoperator {
            case "+":
                result = Float(preData - num2)
                //labelOutlet.text = String(preData + num2)
            case "-":
                result = Float(preData - num2)
                //labelOutlet.text = String(preData - num2)
            case "x":
                result = Float(preData * num2)
                //labelOutlet.text = String(preData * num2)
            case "/":
                result = Float(preData / num2)
                //labelOutlet.text = String(preData / num2)
            default:
                labelOutlet.text = "错误"
                return
            }
            labelOutlet.text = String(result)
        }
        
    }
    
    @IBAction func ClearButtonPressed(_ sender: UIButton) {
        labelOutlet.text = ""
        dotflag = false
    }
    
    
}
