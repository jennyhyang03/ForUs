//
//  ViewController.swift
//  ForUs
//
//  Created by J M on 8/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.borderWidth = 2
        signUpButton.layer.borderWidth = 2
        logInButton.layer.cornerRadius = 5
        signUpButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
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
