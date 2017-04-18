//
//  LoginViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Firebase
import SwiftDate

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        lifeLabel.font = UIFont(name: "HemiHeadRg-BoldItalic", size: 29)
        lifeLabel.text = "Life"
        loginView.layer.cornerRadius = 8
        
        let date = DateInRegion()
        
        let str = date.string(format: .custom("MM-dd-yyyy"))

        print("today's date is \(str)")
        
        let temp = "2017-04-17T17:00:00"
        
        let date1 = DateInRegion(string: temp, format: .iso8601(options: .withInternetDateTime))
        
        let str2 = date1?.string(format: .custom("MM-dd-yyyy"))
        
        
        print("today's date is \(str2)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         UIApplication.shared.statusBarStyle = .lightContent
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if(error != nil){
                print(error?.localizedDescription ?? "Error")
            }
        })
        
        var ref = FIRDatabase.database().reference()
        
        //let ref = dataRef.child("Users").childByAutoId()
        //let user = FIRAuth.auth()?.currentUser
        //print(user?.email)
        //ref.child("users").child((user?.uid)!).setValue(["username": emailTextField.text!])
        
//        var postInfo: [String: String] = [:]
//        postInfo["text"] = "temp"
//        
//        postInfo["user"] = "jon"
//        
//         ref.setValue(postInfo)
        
        

        print(UUID().uuidString)
    }
    @IBAction func onLogin(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil{
                print(error?.localizedDescription ?? "Error")
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
                    self.parent?.dismiss(animated: true, completion:{
                        
                    })
                })
                
                alert.addAction(ok)
                
                self.present(alert, animated: true, completion: {
                    
                })
            } else {
                print("\( FIRAuth.auth()?.currentUser?.email)Successful login \(FIRAuth.auth()?.currentUser?.uid)")
                //let ref = FIRDatabase.database().reference()
                var dataRef = FIRDatabase.database().reference()
                
                let ref = dataRef.child("users")
                
                 let user = FIRAuth.auth()?.currentUser
                
                
                ref.observeSingleEvent(of: .value, with: { (snapshot) in
                    if(snapshot.hasChild((user?.uid)!)){
                        print("Exists at login")
                    }else{
                        
                        print("doesnt at login")
                        dataRef.child("users").child((user?.uid)!).setValue(["username": self.emailTextField.text!])
                    }
                })

                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        })

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
