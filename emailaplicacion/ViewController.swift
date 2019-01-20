//
//  ViewController.swift
//  emailaplicacion
//
//  Created by Edgar Esteban Hernández Maruri on 1/18/19.
//  Copyright © 2019 Edgar Esteban Hernández Maruri. All rights reserved.
//

import UIKit

import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var sigInSelector: UISegmentedControl!
    
    
    @IBOutlet weak var sigInLabel: UILabel!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var sigInButton: UIButton!
    
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func sigInSelectorChanged(_ sender: UISegmentedControl) {
    
        isSignIn = !isSignIn
    
        if isSignIn{
            sigInLabel.text = "Sig In"
            sigInButton.setTitle("Sign In", for: .normal)
        }
        else{
            sigInLabel.text = "Register"
            sigInButton.setTitle("Register", for: .normal)
        }
        
    }
    
    
    
    @IBAction func sigInButtonTapped(_ sender: UIButton) {
    
        //Hacer una validación en el mail y contraseña
        
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            //Revisar si esta entrando o registrandose
            
            if isSignIn{
                //Ingreso del usuario con Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    //Verificar el usuario nil
                    
                    if user != nil {
                        //Usuario encontrado, ir pagina inicio
                        
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                        //Error, verificar error y mostrar mensaje
                        
                        
                    }
                
                })
                
                
            }
            else {
                //Registrando el usuario con Firebase
                
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    
                    //verificzzr el usuario nil
                    if user != nil {
                        //Usuario encontrado, ir pantalla inicio
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                        //Error: verificar error y mostrar mensjae
                    }
                }
            }
        }
        
        
        
    
    }
    
    
    
}

