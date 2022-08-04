//
//  SupportViewController.swift
//  ForUs
//
//  Created by Jenny Yang on 8/3/22.
//

import UIKit
import SafariServices

class SupportViewController: UIViewController {
    @IBOutlet weak var plannedParenthoodFundraiserButton: UIButton!
    
    @IBOutlet weak var carbonB: UILabel!
    @IBOutlet weak var rainforestB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Support"
        // Do any additional setup after loading the view.
        plannedParenthoodFundraiserButton.layer.borderWidth = 2
        carbonB.layer.borderWidth = 2
        rainforestB.layer.borderWidth = 2

        
    }
    
    @IBAction func ppfundraiserPressed(_ sender: Any) {
        if let url = URL(string: "https://www.weareplannedparenthoodaction.org/onlineactions/6iOI0_HnUUmPu_6_SRgayg2?sourceid=1006442&ms=4NALz2100K1N1A&gclid=CjwKCAjw3K2XBhAzEiwAmmgrAuNXzBegIt6Tc3J122-ECWFbz1XpXIpNnaqGzk3OnSdnbkBSV7wjJRoCHAEQAvD_BwE&gclsrc=aw.ds"){
            
            let safariVC = SFSafariViewController(url : url)
            present(safariVC, animated: true, completion: nil)
            
        
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
