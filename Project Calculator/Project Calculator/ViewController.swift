//
//  ViewController.swift
//  Project Calculator
//
//  Created by Eduardo Peregrino on 19/10/19.
//  Copyright © 2019 Eduardo Peregrino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.applyRoundCornersBtn(operations)
        self.applyRoundCornersBtn(numbers)
    }
    
    var num1: Double = 0
    var num2: Double = 0
    var operation: String = ""
    var opSet: Bool = false

    @IBOutlet var numbers: [UIButton]!
    
    @IBOutlet weak var mTextField: UITextField!
    
    @IBAction func getNumber(_ sender: UIButton) {
        if(opSet) {
            mTextField.text = ""
            opSet = false
        }
        switch sender {
            case numbers[0]: mTextField.text = "\(mTextField.text ?? "")0"
                print("0")
                break
            case numbers[1]: mTextField.text = "\(mTextField.text ?? "")1"
                print("1")
                break
            case numbers[2]: mTextField.text = "\(mTextField.text ?? "")2"
                print("2")
                break
            case numbers[3]: mTextField.text = "\(mTextField.text ?? "")3"
                print("3")
                break
            case numbers[4]: mTextField.text = "\(mTextField.text ?? "")4"
                print("4")
                break
            case numbers[5]: mTextField.text = "\(mTextField.text ?? "")5"
                print("5")
                break
            case numbers[6]: mTextField.text = "\(mTextField.text ?? "")6"
                print("6")
                break
            case numbers[7]: mTextField.text = "\(mTextField.text ?? "")7"
                print("7")
                break
            case numbers[8]: mTextField.text = "\(mTextField.text ?? "")8"
                print("8")
                break
            case numbers[9]: mTextField.text = "\(mTextField.text ?? "")9"
                print("9")
                break
            default:
                break
        }
    }
    
    @IBOutlet var operations: [UIButton]!
    
    @IBAction func getOperation(_ sender: UIButton) {
        switch sender {
        case operations[0]: // AC
            mTextField.text = ""
            print("AC")
            break
        case operations[1]: // +
            operation = "+"
            num1 = Double(mTextField.text ?? "0") ?? 0.0
            opSet = true
            print("+")
            break
        case operations[2]: // -
            operation = "-"
            num1 = Double(mTextField.text ?? "0") ?? 0.0
            opSet = true
            print("-")
            break
        case operations[3]: // *
            operation = "*"
            num1 = Double(mTextField.text ?? "0") ?? 0.0
            opSet = true
            print("*")
            break
        case operations[4]: // /
            operation = "/"
            num1 = Double(mTextField.text ?? "0") ?? 0.0
            opSet = true
            print("/")
            break
        case operations[5]: // =
            print("=")
            num2 = Double(mTextField.text ?? "0") ?? 0.0
            calculate(num1, num2, operation)
            break
        default:
            break
        }
    }
    
    func calculate(_ n1: Double, _ n2: Double, _ op: String) {
        switch op {
            case "+":
                let aux = n1 + n2
                mTextField.text = String(aux)
                break
            case "-":
                let aux = n1 - n2
                mTextField.text = String(aux)
                break
            case "*":
                let aux = n1 * n2
                mTextField.text = String(aux)
                break
            case "/":
                if n2 != 0 {
                    let aux = n1 / n2
                    mTextField.text = String(aux)
                } else {
                    mTextField.text = "NAN"
                }
                break
            default:
                break
        }
    }
    
    func applyRoundCornersBtn(_ buttons: [UIButton]) {
        buttons.forEach { (button) in
            button.layer.cornerRadius = button.frame.size.width/2
            button.layer.masksToBounds = true
        }
    }
}

