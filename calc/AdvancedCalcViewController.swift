//
//  AdvancedCalcViewController.swift
//  calc
//
//  Created by MyVirtualMac on 2019/2/28.
//  Copyright © 2019 Ulysses Chen. All rights reserved.
//

import UIKit

class AdvancedCalcViewController: UIViewController {

    @IBOutlet weak var advLabelOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnNumButtonPressed(_ sender: UIButton) {
        let text = sender.currentTitle!
        if advLabelOutlet.text == nil {
            advLabelOutlet.text = sender.currentTitle!
        } else {
            if text == "." {
                if advLabelOutlet.text?.contains(".") ?? false {
                    return
                }
            }
            advLabelOutlet.text?.append(contentsOf: text)    
            }
        }
        
    
    
    @IBAction func ClearButtonPressed(_ sender: UIButton) {
        advLabelOutlet.text = ""
    }
    
    @IBAction func OnBackButtonPressed(_ sender: UIButton) {
        if advLabelOutlet.text == nil || advLabelOutlet.text == "" {
            return
        } else {
            advLabelOutlet.text?.removeLast()
        }
    }
    
    @IBAction func onSolutionPressed(_ sender: UIButton) {
        if advLabelOutlet.text == "" || advLabelOutlet.text == nil {
            return
        } else {
            let text = advLabelOutlet.text!
            let temp = calcpostexp(postexp: mid2back(origin: text))
            advLabelOutlet.text = String(temp)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func mid2back (origin: String) -> [String] {
        var postexp = [String]()
        let myoperator = "+-x÷" ; let nums = "1234567890."
        var temp = ""
        var stack = [String]()
        for x in origin {
            //操作数 输进后缀表达式
            if nums.contains(x) {
                temp.append(x)
            }   //操作符
            else {
                if temp != "" {
                    postexp.append(temp)
                }
                temp = ""
                if myoperator.contains(x) {
                    switch x {
                        case "+","-":
                            while !stack.isEmpty {
                                if stack.last != "(" {
                                    postexp.append(stack.last!)
                                    stack.removeLast()
                                } else { break }
                            }
                            stack.append(String(x))
                        case "x":
                            while !stack.isEmpty {
                                if stack.last == "*" || stack.last == "/" {
                                    postexp.append(stack.last!)
                                    stack.removeLast()
                                } else { break }
                            }
                            stack.append("*")
                        case "÷":
                            while !stack.isEmpty {
                                if stack.last == "*" || stack.last == "/" {
                                    postexp.append(stack.last!)
                                    stack.removeLast()
                                } else { break }
                            }
                            stack.append("/")
                        default:
                            break
                    }
                }
                if x == "(" {
                    stack.append("(")
                }
                if x == ")" {
                    while stack.last != "(" {
                        postexp.append(stack.last ?? "")
                        stack.removeLast()
                    }
                    stack.removeLast()
                }
                
            }
        }
        while temp != ""  {
            postexp.append(temp)
            temp = ""
        }
        while !stack.isEmpty {
            postexp.append(stack.last ?? "")
            stack.removeLast()
        }
        return postexp
    }
    
    func calcpostexp(postexp:[String]) -> Double {
        var a:Double = 0 ,b:Double = 0 ,c:Double = 0
        let nums = "1234567890."    //let myoperator = "+-x÷" ;
        var opnd = [String]()
        for x in postexp {
            switch x {
            case "+":
                a = Double(opnd.last!)!
                opnd.removeLast()
                b = Double(opnd.last!)!
                opnd.removeLast()
                c = b + a
                opnd.append(String(c))
            case "-":
                a = Double(opnd.last!)!
                opnd.removeLast()
                b = Double(opnd.last!)!
                opnd.removeLast()
                c = b - a
                opnd.append(String(c))
            case "*":
                a = Double(opnd.last!)!
                opnd.removeLast()
                b = Double(opnd.last!)!
                opnd.removeLast()
                c = b * a
                opnd.append(String(c))
            case "/":
                a = Double(opnd.last!)!
                opnd.removeLast()
                b = Double(opnd.last!)!
                opnd.removeLast()
                c = b / a
                opnd.append(String(c))
            default:
                if nums.contains(x.first ?? "?") {
                    opnd.append(x)
                }
                break
            }
        }
        let res = Double(opnd.last!)!
        return res
    }
    
}

