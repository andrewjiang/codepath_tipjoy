//
//  ViewController.swift
//  TipJoy
//
//  Created by Andrew Jiang on 2/1/15.
//  Copyright (c) 2015 Hitchhiker Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField:
        UITextField!
    @IBOutlet weak var tipLabel:
        UILabel!
    @IBOutlet weak var totalLabel:
        UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("firstTipSet") == nil) || (defaults.objectForKey("secondTipSet") == nil) || (defaults.objectForKey("thirdTipSet") == nil) {
            println("nothingset")
            
            defaults.setObject("18", forKey: "firstTipSet")
            defaults.setObject("20", forKey: "secondTipSet")
            defaults.setObject("22", forKey: "thirdTipSet")
            
            defaults.synchronize()
            
        }
        
        
    
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        println(defaults.objectForKey("firstTipSet"))
        
        var firstTip = (defaults.objectForKey("firstTipSet") as String) + "%"
        var secondTip = (defaults.objectForKey("secondTipSet") as String) + "%"
        var thirdTip = (defaults.objectForKey("thirdTipSet") as String) + "%"
        
        tipControl.setTitle(firstTip, forSegmentAtIndex: 0)
        tipControl.setTitle(secondTip, forSegmentAtIndex: 1)
        tipControl.setTitle(thirdTip, forSegmentAtIndex: 2)
        
        updateFigures()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateFigures()
    }
    
    func updateFigures(){
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var tipPercentages = [defaults.objectForKey("firstTipSet") as String, defaults.objectForKey("secondTipSet") as String, defaults.objectForKey("thirdTipSet") as String]
        var tipPercentage = (tipPercentages[tipControl.selectedSegmentIndex] as NSString).doubleValue / 100
        var billAmt = (billField.text as NSString).doubleValue
        var tip = billAmt * tipPercentage
        var total = billAmt + tip
        
        tipLabel.text = NSString(format: "$%.2f", tip)
        totalLabel.text = NSString(format: "$%.2f", total)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

