//
//  RegisterViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-20.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var regiEmail: UITextField!
    @IBOutlet var regiPassword: UITextField!
    @IBOutlet var regiName: UITextField!
    @IBOutlet var regiBirth: UITextField!
    
    var regiAccount: [MomoAccount] = []
    @IBAction func registerButton (sender: UIButton) {
        regiAccount = [MomoAccount(email: (regiEmail?.text)!, password: (regiPassword?.text)!, fullname: (regiName?.text)!, birth: (regiBirth?.text)!)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
