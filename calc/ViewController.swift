//
//  ViewController.swift
//  calc
//
//  Created by One27 on 2022/03/11.
//  rrlgh5532@me.com
//  Please visit my blog https://odos-1110.tistory.com
//////

import UIKit

class ViewController: UIViewController {
    
    var target = 0.0
    var temp = 0.0
    var temp2 = 0.0
    var targetString = ""
    var calcQ = ""
    var triger = 0
    var operationcount = 0
    
    @IBOutlet var lab_value: UILabel!
    @IBOutlet var lab_history0: UILabel!
    @IBOutlet var lab_history1: UILabel!
    @IBOutlet var lab_history2: UILabel!
    @IBOutlet var lab_history3: UILabel!
    @IBOutlet var lab_history4: UILabel!
    @IBOutlet var lab_history5: UILabel!
    @IBOutlet var lab_history6: UILabel!
    @IBOutlet var lab_history7: UILabel!
    @IBOutlet var lab_history8: UILabel!
    
    func calcNum(tempA:Int){
        targetString += String(tempA)
        lab_value.text = targetString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        target = 0.0
        targetString = ""
        // Do any additional setup after loading the view.
    }
    
    func saveHistory(history:String){
        lab_history8.text = lab_history7.text
        lab_history7.text = lab_history6.text
        lab_history6.text = lab_history5.text
        lab_history5.text = lab_history4.text
        lab_history4.text = lab_history3.text
        lab_history3.text = lab_history2.text
        lab_history2.text = lab_history1.text
        lab_history1.text = lab_history0.text
        lab_history0.text = history
    }

    func operations(optype:Int){
        
        triger = 2
        target = Double(targetString) ?? 0
        
        switch optype{
        case 0:
            targetString = "+"
            calcQ = "+"
        case 1:
            targetString = "-"
            calcQ = "-"
        case 2:
            targetString = "*"
            calcQ = "*"
        case 3:
            targetString = "/"
            calcQ = "/"
        default:
            break
        }
        lab_value.text = targetString
    }
    
    @IBAction func btn_div(_ sender: UIButton) {
        if(operationcount==0){
            operations(optype: 3)
            operationcount=1
        }
    }
    @IBAction func btn_multi(_ sender: UIButton) {
        if(operationcount==0){
            operations(optype: 2)
            operationcount=1
        }
    }
    @IBAction func btn_sub(_ sender: UIButton) {
        if(operationcount==0){
            operations(optype: 1)
            operationcount=1
        }
    }
    @IBAction func btn_add(_ sender: UIButton) {
        if(operationcount==0){
            operations(optype: 0)
            operationcount=1
        }
    }
    
    @IBAction func btn_showresult(_ sender: Any) {
        if(triger==0){
            if(calcQ=="+"){
                temp = (Double(targetString) ?? 0) + target
                lab_value.text = " = "+String(temp)
            }else if(calcQ == "-"){
                temp = target - (Double(targetString) ?? 0)
                lab_value.text = " = "+String(temp)
            }else if(calcQ == "*"){
                temp = target * (Double(targetString) ?? 0)
                lab_value.text = " = "+String(temp)
            }else if(calcQ == "/"){
                let temp2 = Double(target) / (Double(targetString) ?? 0)
                lab_value.text = " = "+String(temp2)
            }
            var save:String = String(target)+" "
            save += calcQ+" "
            save += targetString+lab_value.text!
            saveHistory(history: save)
            triger=3
            operationcount=0
        }
    }
    @IBAction func btn_ac(_ sender: Any) {
        inits()
        operationcount=0
    }
    
    func inits(){
        target = 0.0
        temp = 0.0
        temp2 = 0.0
        targetString = ""
        calcQ = ""
        triger = 0
        lab_value.text = "clear"
    }
   
    @IBAction func btn_Dot(_ sender: Any) {
        if(triger==1){
            inits()
        }else if(triger==2){
            targetString = "0."
            lab_value.text = targetString
        }else{
            targetString += "."
            lab_value.text = targetString
        }
    }
    
    func checkTriger(){
        if(triger==1){
            inits()
        }else if(triger == 2||triger==3){
            targetString = ""
            lab_value.text = targetString
            triger = 0
        }
    }
    
    @IBAction func btn_1(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:1)
    }
    @IBAction func btn_2(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:2)
    }
    @IBAction func btn_3(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:3)
    }
    @IBAction func btn_4(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:4)
    }
    @IBAction func btn_5(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:5)
    }
    @IBAction func btn_6(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:6)
    }
    @IBAction func btn_7(_ sender: UIButton) {
        checkTriger()
        calcNum(tempA:7)
    }
    @IBAction func btn_8(_ sender: Any) {
        checkTriger()
        calcNum(tempA:8)
    }
    @IBAction func btn_9(_ sender: Any) {
        checkTriger()
        calcNum(tempA:9)
    }
    @IBAction func btn_0(_ sender: Any) {
        checkTriger()
        if(targetString.count<1){
            lab_value.text = "0"
        }
        calcNum(tempA:0)
    }
}

