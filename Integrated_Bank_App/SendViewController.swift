//
//  SendViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-18.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {
    @IBOutlet var amountText: UITextField!
    @IBOutlet var recipientText: UITextField!
    
    var transactionData: [Transaction] = []
    //var transactionNumber = 0 for more functionality
    
    // update balance in view controller
    // connect segue with view controller
    weak var delegate: ViewController!
    @IBAction func send (sender: UIButton) {
        
        // if bank transaction <= 5
        if self.delegate.transactionGet.count <= 4{
            self.delegate.bankAccounts[0].balance -= Float(amountText.text!)!
            
            // current time to string
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let myString = formatter.string(from: Date())
            let yourDate = formatter.date(from: myString)
            formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
            let myStringafd = formatter.string(from: yourDate!)
            
            if transactionData.count == 0 {
                //need change for sentaccount default bank account
                transactionData.append(Transaction(sentamount: amountText.text!, senttime: myStringafd, sentaccount: "4724 0439 XXXX XXXX", recipientaccount: recipientText.text! ))
            }
            // created transactionData which should be transffered back to History View
            
            self.delegate.transactionGet.append(transactionData[0])
            //transactionNumber += 1 for more functionality
        }
        
        // if bank transaction >= 5
        else {
            // prompt
            let refreshAlert = UIAlertController(title: "You have made 5 or more transactions", message: "Do you want to pay 0.2$ to proceed?", preferredStyle: UIAlertControllerStyle.alert)
        
            // proceed
            refreshAlert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
                self.delegate.bankAccounts[0].balance -= (Float(self.amountText.text!)! + 0.2)
                // current time to string
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let myString = formatter.string(from: Date())
                let yourDate = formatter.date(from: myString)
                formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
                let myStringafd = formatter.string(from: yourDate!)
                // created transactionData which should be transffered back to History View
                if self.transactionData.count == 0 {
                    //need change for sentaccount default bank account
                    self.transactionData.append(Transaction(sentamount: self.amountText.text!, senttime: myStringafd, sentaccount: "4724 0439 XXXX XXXX", recipientaccount: self.recipientText.text! ))
                }
                self.delegate.transactionGet.append(self.transactionData[0])
                //this code makes user to go to succeed page 
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                    self.performSegue(withIdentifier: "sendtoSucceedSegue", sender: self)
                })
            }))
            
            // cancel
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Cancelled")
                
            }))
            present(refreshAlert, animated: true, completion: nil)
        }
    }
    
    //new segue to succeed view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendtoSucceedSegue" {
            let controller = segue.destination as! SucceedViewController
            controller.delegate = self
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back to My Account", style:.plain, target:nil, action:nil)*/
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
