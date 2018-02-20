//
//  SucceedViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class SucceedViewController: UIViewController {
    
    @IBOutlet var sentInfo: UILabel!
    @IBAction func succeedbutton (sender: UIButton) {
        // go back two (back to my account button)
        var viewControllers = navigationController?.viewControllers
        viewControllers?.removeLast(2) // views to pop
        navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    
    //segue section
    var transactionDisplay: [Transaction] = []
    weak var delegate: SendViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide button
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        
        //section recieve transaction Display
        transactionDisplay = self.delegate.transactionData
        
        sentInfo?.text = "Sent Info \n" + "Sent to: " + transactionDisplay[0].recipientaccount + "\n" + "Amount: " + transactionDisplay[0].sentamount + "$ CAD"
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
