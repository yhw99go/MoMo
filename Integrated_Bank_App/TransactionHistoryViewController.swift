//
//  TransactionHistoryViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class TransactionHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var transactionTableView: UITableView!
    var transactionHistory: [Transaction] = []
    
    //seguesection
    weak var delegate: ViewController!


    override func viewWillAppear(_ animated: Bool) {
        transactionHistory = self.delegate.transactionGet
        transactionHistory = transactionHistory.reversed()
        transactionTableView.reloadData()
        /*
        if transactionHistory.count == 0 {
            //date implementation
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let today = Date()
            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)
            let myString = formatter.string(from: yesterday!)
            let yourDate = formatter.date(from: myString)
            formatter.dateFormat = "dd-MMM-yyyy"
            let myStringafd = formatter.string(from: yourDate!)
            
            //default for transaction history
            transactionHistory.append(Transaction(sentamount: "100", senttime: myStringafd, sentaccount: "4724 0439 3948 2949", recipientaccount: "123-456-789"))
        }*/
        super.viewWillAppear(animated)
    }

    
    
    // 2nd part connect lists to labels
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionHistory.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let historycell = tableView.dequeueReusableCell(withIdentifier: "hiscell", for: indexPath) as! TransactionHistoryTableViewCell
        let idx : Int = indexPath.row
        historycell.sentAmount?.text = transactionHistory[idx].sentamount + "$ CAD"
        historycell.sentTime?.text = transactionHistory[idx].senttime
        historycell.sentAccount?.text = transactionHistory[idx].sentaccount
        historycell.recipientAccount?.text = transactionHistory[idx].recipientaccount
        return historycell
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionHistory = transactionHistory.reversed()
        transactionTableView.tableFooterView = UIView(frame: CGRect.zero)
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
