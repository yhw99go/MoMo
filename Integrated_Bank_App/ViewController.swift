//
//  ViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-18.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mainTableView: UITableView!
    var bankAccounts: [Account] = []
    var transactionGet: [Transaction] = []
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if bankAccounts.count == 0 {
            bankAccounts.append(Account(bankname: "Toronto Dominion", accountnumber: "4724 0439 XXXX XXXX", balance: 1875.00, imageUrl: "https://specials-images.forbesimg.com/imageserve/5a67bf314bbe6f2652f36244/300x300.jpg?background=000000&cropX1=0&cropX2=416&cropY1=0&cropY2=416"))
        }
        super.viewWillAppear(animated)
    }
    
    
    
    // 2nd part connect to lists to labels
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankAccounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let accountcell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        let idx : Int = indexPath.row
        
        accountcell.accountNumber?.text = bankAccounts[idx].accountnumber
        accountcell.accountBalance?.text = String(bankAccounts[idx].balance) + "$"
        displayBankImage(idx, accountcell: accountcell)
        // display on the table view?
        return accountcell
    }
    // function for displaying image setting image url to the @iboutlet
    func displayBankImage(_ row: Int, accountcell: CustomTableViewCell) {
        let url: String = (URL(string: bankAccounts[row].imageUrl)?.absoluteString)!
        //shared is simplistic version of making a http call
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async (execute: {
                let image = UIImage(data: data!)
                accountcell.accountImageView?.image = image
            })
        }).resume()
    }
    
    
    
    
    
    
    
    //segue connecting two views. can update values between connected segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendMoneySegue" {
            let controller = segue.destination as! SendViewController
            controller.delegate = self
        }
        if segue.identifier == "viewHistorySeuge" {
            let controller = segue.destination as! TransactionHistoryViewController
            controller.delegate = self
        }
        if segue.identifier == "addAccountSegue" {
            let controller = segue.destination as! AddBankViewController
            controller.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.tableFooterView = UIView(frame: CGRect.zero)
        mainTableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

