//
//  ViewController.swift
//  Calculator
//
//  Created by Rajat Gosal on 12/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }

    func clearAll(){
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculatorWorkings.text = workings
        }
        
    }
    @IBAction func equals(_ sender: Any) {
        if(validInput()){
            let checkedWorkingsForPercentage = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercentage)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else{
            let alert = UIAlertController(
                title: "INVALID INPUT",
                message: "CALCULATOR UNABLE TO DO THE MATH BASED ON THE INPUT",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funCharIndexes = [Int]()
        for char in workings{
            if(specialCharacter(char: char)){
                funCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funCharIndexes{
            if(index == 0){
                return false
            }
            if(index == workings.count - 1){
                return false
            }
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if (char=="*"){
            return true
        }
        if (char=="/"){
            return true
        }
        if (char=="+"){
            return true
        }
        if (char=="-"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentage(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func division(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func multiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func substract(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func add(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }

    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    
    
}

