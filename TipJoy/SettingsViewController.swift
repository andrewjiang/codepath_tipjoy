//
//  SettingsViewController.swift
//  TipJoy
//
//  Created by Andrew Jiang on 2/2/15.
//  Copyright (c) 2015 Hitchhiker Labs. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        firstTipField.text = defaults.objectForKey("firstTipSet") as String
        secondTipField.text = defaults.objectForKey("secondTipSet") as String
        thirdTipField.text = defaults.objectForKey("thirdTipSet") as String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTap2(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func saveSettingsButton(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var firstTip = firstTipField.text
        
        var secondTip = secondTipField.text
        
        var thirdTip = thirdTipField.text
        
        defaults.setObject(firstTip, forKey: "firstTipSet")
        defaults.setObject(secondTip, forKey: "secondTipSet")
        defaults.setObject(thirdTip, forKey: "thirdTipSet")
        
        defaults.synchronize()
        
        var alert = UIAlertController(title: "Success", message: "Custom tips set", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}