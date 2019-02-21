//
//  ViewController.swift
//  calc
//
//  Created by MyVirtualMac on 2019/2/21.
//  Copyright © 2019 Ulysses Chen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    var result:Double = 0
    var myoperator:String?
    var backwardsString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func OnNumButtonPressed(_ sender: UIButton) {
        let text = sender.currentTitle!
        if labelOutlet.text == nil {
            labelOutlet.text = sender.currentTitle!
        } else {
            labelOutlet.text?.append(contentsOf: text)
        }
        
    }
    
    @IBAction func OnOperatorPressed(_ sender: UIButton) {
        if labelOutlet.text == nil {
            return
        }
        result = Double(labelOutlet.text!)!
        switch sender.currentTitle {
        case "+":
            labelOutlet.text = ""
            myoperator = "+"
        case "-":
            labelOutlet.text = ""
            myoperator = "-"
        case "x":
            labelOutlet.text = ""
            myoperator = "x"
        case "/":
            labelOutlet.text = ""
            myoperator = "/"
        default:
            break
        }
    }
    
    @IBAction func SolutionButtonPressed(_ sender: UIButton) {
        if labelOutlet.text == nil {
            return
        } else {
            let num2 = Double(labelOutlet.text!)!
            switch myoperator {
            case "+":
                labelOutlet.text = String(result + num2)
            case "-":
                labelOutlet.text = String(result - num2)
            case "x":
                labelOutlet.text = String(result * num2)
            case "/":
                labelOutlet.text = String(result / num2)
            default:
                break
            }
        }
        
        
    }
    @IBAction func ClearButtonPressed(_ sender: UIButton) {
        labelOutlet.text = ""
    }
    
    func midtoback(origin:String?) -> String {
        if origin == nil {
            return "错误"
        } else {
            
            return "."
        }
    }
    
    
}

class stack {
    var values = ""
    func stackin(char:Character) {
        values.append(char)
    }
    
}
