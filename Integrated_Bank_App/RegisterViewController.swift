//
//  RegisterViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-20.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var regiEmail: UITextField!
    @IBOutlet weak var regiPassword: UITextField!
    @IBOutlet weak var regiName: UITextField!
    @IBOutlet weak var regiBirth: UITextField!
    @IBOutlet weak var registerbutton: UIButton!
    
    var regiAccount: [MomoAccount] = []
    @IBAction func registerButton (sender: UIButton) {
        regiAccount = [MomoAccount(email: (regiEmail?.text)!, password: (regiPassword?.text)!, fullname: (regiName?.text)!, birth: (regiBirth?.text)!)]
    }
    
    //logic for enabling the button
    @IBAction func emailchanged(_ sender: Any) {
        if validatebirt(text: regiEmail.text!) {
            //signinbutton.isEnabled = true
            if (regiPassword.text?.characters.count)! > 0 &&
                (regiName.text?.characters.count)! > 0 &&
                validatebirt(text: regiBirth.text!) {
                registerbutton.isEnabled = true
            } else {
                registerbutton.isEnabled = false
            }
        }
        else {
            registerbutton.isEnabled = false
        }
    }
    @IBAction func passwordchanged(_ sender: Any) {
        if validatebirt(text: regiPassword.text!) {
            //signinbutton.isEnabled = true
            if (regiEmail.text?.characters.count)! > 0 &&
                (regiName.text?.characters.count)! > 0 &&
                validatebirt(text: regiBirth.text!) {
                registerbutton.isEnabled = true
            } else {
                registerbutton.isEnabled = false
            }
        }
    }
    @IBAction func fullnamechanged(_ sender: Any) {
        if validatebirt(text: regiName.text!) {
            //signinbutton.isEnabled = true
            if (regiEmail.text?.characters.count)! > 0 &&
                (regiPassword.text?.characters.count)! > 0 &&
                validatebirt(text: regiBirth.text!) {
                registerbutton.isEnabled = true
            } else {
                registerbutton.isEnabled = false
            }
        }
    }
    @IBAction func birthchanged(_ sender: Any) {
        if validatebirt(text: regiBirth.text!) {
            //signinbutton.isEnabled = true
            if (regiEmail.text?.characters.count)! > 0 &&
                (regiPassword.text?.characters.count)! > 0 &&
                (regiName.text?.characters.count)! > 0 {
                registerbutton.isEnabled = true
            } else {
                registerbutton.isEnabled = false
            }
        }
        else {
            registerbutton.isEnabled = false
        }
    }
    
    func validatebirt(text: String) -> Bool {
        var result = false
        if text.characters.count == 6 && Int(text) != nil {
            result = false
        }
        else {
            result = true
        }
        return result
    }
    func validateInput(text: String) -> Bool {
        var result = false
        if text.characters.count == 0 {
            result = false
        }
        else {
            result = true
        }
        return result
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regiEmail.delegate = self
        self.regiPassword.delegate = self
        self.regiName.delegate = self
        self.regiBirth.delegate = self
        // Do any additional setup after loading the view.
        registerbutton.isEnabled = false
    }

    //text field disappear when touching screen or return
    override func touchesBegan(_ touches: Set<UITouch>, with even: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return (true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
