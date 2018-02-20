//
//  AddBankViewController.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class AddBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var addBankTableView: UITableView!
    
    var receiveBankInfo: [Account] = []
    var sendSelectedBankInfo: [Account] = []
    var bankInfo: [Account] = [Account(bankname: "Toronto Dominion", accountnumber: "", balance: 2000, imageUrl: "https://specials-images.forbesimg.com/imageserve/5a67bf314bbe6f2652f36244/300x300.jpg?background=000000&cropX1=0&cropX2=416&cropY1=0&cropY2=416"), Account(bankname: "Scotia Bank", accountnumber: "", balance: 2000, imageUrl: "https://media.glassdoor.com/sqll/11013/scotiabank-squarelogo-1466514988647.png"), Account(bankname: "Royal Bank of Canada", accountnumber: "", balance: 2000, imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/7/7f/RBC_Royal_Bank.svg/1200px-RBC_Royal_Bank.svg.png"), Account(bankname: "Bank of Montreal", accountnumber: "", balance: 2000, imageUrl: "https://media.licdn.com/media/AAEAAQAAAAAAAAKiAAAAJDE4MWY1ZjliLWZlOGYtNDU2Ni05ZTBlLTQyNmUxMjIxZjJlMQ.png"), Account(bankname: "CIBC", accountnumber: "", balance: 2000, imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/c/cf/CIBC_logo.svg/1121px-CIBC_logo.svg.png"), Account(bankname: "HSBC", accountnumber: "", balance: 2000, imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/JOF8HUw1XCZCxwebn1tHRw/ls.jpg"), Account(bankname: "National Bank of Canada", accountnumber: "", balance: 2000, imageUrl: "https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/9d/52/0c/9d520cf0-ceae-b12a-e75e-15d92645fc32/mzl.aaausvyn.png/600x600bf.jpg"), Account(bankname: "Desjardins Group", accountnumber: "", balance: 2000, imageUrl: "https://www.desjardins.com/ressources/images/desjardins-facebook-generique.jpg"), Account(bankname: "Laurentian Bank", accountnumber: "", balance: 2000, imageUrl: "https://pbs.twimg.com/profile_images/755789671398072320/fl-ogjhp_400x400.jpg"), Account(bankname: "Canadian Western Bank", accountnumber: "", balance: 2000, imageUrl: "https://www.marketbeat.com/logos/canadian-western-bank-logo.jpg")]
    weak var delegate: ViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        addBankTableView.reloadData()
        super.viewWillAppear(animated)
        print ("hello")
        print (receiveBankInfo.count)
        if receiveBankInfo.count > 0 {
            self.delegate.bankAccounts.append(receiveBankInfo[0])
        }
    }
    
    
    // actually show table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bankcell = tableView.dequeueReusableCell(withIdentifier: "addcell", for: indexPath) as! AddTableViewCell
        let idx : Int = indexPath.row
        //tag it
        bankcell.addButton.tag = idx
        
        bankcell.bankName?.text = bankInfo[idx].bankname
        displayBankImage(idx, bankcell: bankcell)
        // display on the table view?
        return bankcell
    }
    
    // function for displaying image setting image url to the @iboutlet
    func displayBankImage(_ row: Int, bankcell: AddTableViewCell) {
        let url: String = (URL(string: bankInfo[row].imageUrl)?.absoluteString)!
        //shared is simplistic version of making a http call
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async (execute: {
                let image = UIImage(data: data!)
                bankcell.bankImageView?.image = image
            })
        }).resume()
    }

    
    // connecting segue addbankviewcontroller to personalinfoviewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSubmitSegue" {
            let controller = segue.destination as! PersonalInfoViewController
            controller.delegate = self
        }
    }
    var a = 0
    @IBAction func addButton (sender: UIButton) {
        print("Item #\(sender.tag) was selected as a favorite")
        print( (bankInfo.count))
        a = sender.tag
        //self.delegate.favoriteMovies.append(searchResults[sender.tag])
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
