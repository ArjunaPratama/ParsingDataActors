//
//  ViewController.swift
//  ParsingDataActors
//
//  Created by DOTS2 on 11/3/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelchild: UILabel!
    @IBOutlet weak var labelspouse: UILabel!
    @IBOutlet weak var labelheight: UILabel!
    @IBOutlet weak var labelcountry: UILabel!
    @IBOutlet weak var labeName: UILabel!
    @IBOutlet weak var labeldesc: UILabel!
    @IBOutlet weak var labeldob: UILabel!
    
    var passName:String?
    var passDesc:String?
    var passdob:String?
    var passcountry:String?
    var passheight:String?
    var passspouse:String?
    var passchild:String?
    
    override func viewDidLoad() {
        
        labeName.text = passName!
        labeldob.text = passdob!
        labeldesc.text = passDesc!
        labelchild.text = passchild!
        labelheight.text = passheight!
        labelspouse.text = passspouse!
        labelcountry.text = passcountry!
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

