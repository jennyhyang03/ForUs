//
//  SignUpViewController.swift
//  ForUs
//
//  Created by J M on 8/2/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements(){
        
        //hide the error label
        errorLabel.alpha = 0
        
    }
    

   
    @IBAction func signUpPressed(_ sender: Any) {
        
        guard let email = emailTextField.text else {return }
        guard let password = passwordTextField.text else{
             return
        }
       /*
        Auth.auth().createUser(withEmail: email, password: password){ fireBasseResult, error in if let e = error {
            
            self.errorLabel.alpha = 1
            self.errorLabel.text = "Please try again"
            
      
            
            
        }else{
            
     
    
        }   */
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


