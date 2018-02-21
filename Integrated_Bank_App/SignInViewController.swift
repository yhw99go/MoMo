//
//  SignInViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-20.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signinbutton: UIButton!
    
    var sgininAccount: [MomoAccount] = []
    
    @IBAction func signinButton(sender: UIButton) {
        sgininAccount = [MomoAccount(email: (userName?.text)!, password: (password?.text)!, fullname: "", birth: "")]
    }

    // function for enabling button
    @IBAction func usernamechanged(_ sender: Any) {
        if validateInput(text: userName.text!) {
            //signinbutton.isEnabled = true
            if (password.text?.characters.count)! > 0 {
                signinbutton.isEnabled = true
            } else {
                signinbutton.isEnabled = false
            }
        }
        else {
            signinbutton.isEnabled = false
        }

    }
    @IBAction func passwordchanged(_ sender: Any) {
        if validateInput(text: password.text!) {
            //signinbutton.isEnabled = true
            if (userName.text?.characters.count)! > 0 {
                signinbutton.isEnabled = true
            } else {
                signinbutton.isEnabled = false
            }
        }
        else {
            signinbutton.isEnabled = false
        }
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
        self.userName.delegate = self
        self.password.delegate = self
        // Do any additional setup after loading the view.
        signinbutton.isEnabled = false
        
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
