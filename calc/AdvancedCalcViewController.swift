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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
