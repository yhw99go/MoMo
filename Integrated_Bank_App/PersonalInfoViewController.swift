//
//  PersonalInfoViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    
    @IBOutlet var bankaccountnumber: UITextField!
    @IBOutlet var bankName : UILabel!
    @IBOutlet var bankimageview : UIImageView!
    
    @IBAction func addInMyAccount (sender: UIButton) {
        //go back to My accounts
        var viewControllers = navigationController?.viewControllers
        viewControllers?.removeLast(1) // views to pop
        navigationController?.setViewControllers(viewControllers!, animated: true)
        selectedbank[0].accountnumber = bankaccountnumber.text!
        selectedbank[0].balance = 1875
        self.delegate.receiveBankInfo = [selectedbank[0]]
    }

    weak var delegate: AddBankViewController!
    var selectedbank: [Account] = []
    var bringBankInfo: [Account] = [Account(bankname: "Toronto Dominion", accountnumber: "", balance: 2000, imageUrl: "https://specials-images.forbesimg.com/imageserve/5a67bf314bbe6f2652f36244/300x300.jpg?background=000000&cropX1=0&cropX2=416&cropY1=0&cropY2=416"), Account(bankname: "Scotia Bank", accountnumber: "", balance: 2000, imageUrl: "https://media.glassdoor.com/sqll/11013/scotiabank-squarelogo-1466514988647.png"), Account(bankname: "Royal Bank of Canada", accountnumber: "", balance: 2000, imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/7/7f/RBC_Royal_Bank.svg/1200px-RBC_Royal_Bank.svg.png"), Account(bankname: "Bank of Montreal", accountnumber: "", balance: 2000, imageUrl: "https://media.licdn.com/media/AAEAAQAAAAAAAAKiAAAAJDE4MWY1ZjliLWZlOGYtNDU2Ni05ZTBlLTQyNmUxMjIxZjJlMQ.png"), Account(bankname: "CIBC", accountnumber: "", balance: 2000, imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/c/cf/CIBC_logo.svg/1121px-CIBC_logo.svg.png"), Account(bankname: "HSBC", accountnumber: "", balance: 2000, imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/JOF8HUw1XCZCxwebn1tHRw/ls.jpg"), Account(bankname: "National Bank of Canada", accountnumber: "", balance: 2000, imageUrl: "https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/9d/52/0c/9d520cf0-ceae-b12a-e75e-15d92645fc32/mzl.aaausvyn.png/600x600bf.jpg"), Account(bankname: "Desjardins Group", accountnumber: "", balance: 2000, imageUrl: "https://www.desjardins.com/ressources/images/desjardins-facebook-generique.jpg"), Account(bankname: "Laurentian Bank", accountnumber: "", balance: 2000, imageUrl: "https://pbs.twimg.com/profile_images/755789671398072320/fl-ogjhp_400x400.jpg"), Account(bankname: "Canadian Western Bank", accountnumber: "", balance: 2000, imageUrl: "https://www.marketbeat.com/logos/canadian-western-bank-logo.jpg")]
    
    override func viewWillAppear(_ animated: Bool) {
        // add here update the selected bank
        super.viewWillAppear(animated)
    }
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //brought Bank Info
        let idxFromAddBank = self.delegate.a
        selectedbank = [bringBankInfo[idxFromAddBank]]
        bankName?.text = selectedbank[0].bankname
        
        let url: String = (URL(string: selectedbank[0].imageUrl)?.absoluteString)!
        //shared is simplistic version of making a http call
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async (execute: {
                let image = UIImage(data: data!)
                self.bankimageview?.image = image
            })
        }).resume()

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
