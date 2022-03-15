//
//  ViewController.swift
//  calc
//
//  Created by One27 on 2022/03/11.
//  rrlgh5532@me.com
//  Please visit my blog https://odos-1110.tistory.com
////

import UIKit

class ViewController: UIViewController {
    
    var target = 0
    var temp = 0
    var temp2 = 0.0
    var index = 0
    var targetString = ""
    var calcQ = ""
    
    func calcNum(tempA:Int){
        targetString += String(tempA)
        lab_value.text = targetString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        target = 0
        targetString = ""
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lab_value: UILabel!

    @IBAction func btn_div(_ sender: UIButton) {
        target = Int(targetString) ?? 0
        targetString = ""
        lab_value.text = targetString
        calcQ += "/"

    }
    @IBAction func btn_multi(_ sender: UIButton) {
        target = Int(targetString) ?? 0
        targetString = ""
        lab_value.text = targetString
        calcQ += "*"
    }
    @IBAction func btn_sub(_ sender: UIButton) {
        target = Int(targetString) ?? 0
        targetString = ""
        lab_value.text = targetString
        calcQ += "-"
    }
    @IBAction func btn_add(_ sender: UIButton) {
        target = Int(targetString) ?? 0
        targetString = ""
        lab_value.text = targetString
        calcQ += "+"
    }
    @IBAction func btn_showresult(_ sender: Any) {
        if(calcQ=="+"){
            temp = (Int(targetString) ?? 0) + target
            lab_value.text = "="+String(temp)
        }else if(calcQ == "-"){
            temp = target - (Int(targetString) ?? 0)
            lab_value.text = "="+String(temp)
        }else if(calcQ == "*"){
            temp = target * (Int(targetString) ?? 0)
            lab_value.text = "="+String(temp)
        }else if(calcQ == "/"){
            var temp = Double(target) / (Double(targetString) ?? 0)
            lab_value.text = "="+String(temp)
        }
    }
    @IBAction func btn_ac(_ sender: Any) {
        targetString = ""
        target = 0
        temp = 0
        calcQ = ""
        lab_value.text = "clear"
    }
    
    @IBAction func btn_1(_ sender: UIButton) {
        calcNum(tempA:1)
    }
    @IBAction func btn_2(_ sender: UIButton) {
        calcNum(tempA:2)
    }
    @IBAction func btn_3(_ sender: UIButton) {
        calcNum(tempA:3)
    }
    @IBAction func btn_4(_ sender: UIButton) {
        calcNum(tempA:4)
    }
    @IBAction func btn_5(_ sender: UIButton) {
        calcNum(tempA:5)
    }
    @IBAction func btn_6(_ sender: UIButton) {
        calcNum(tempA:6)
    }
    @IBAction func btn_7(_ sender: UIButton) {
        calcNum(tempA:7)
    }
    @IBAction func btn_8(_ sender: Any) {
        calcNum(tempA:8)
    }
    @IBAction func btn_9(_ sender: Any) {
        calcNum(tempA:9)
    }
    @IBAction func btn_0(_ sender: Any) {
        if(targetString.count<1){
            lab_value.text = "0"
        }
        calcNum(tempA:0)
    }
}

