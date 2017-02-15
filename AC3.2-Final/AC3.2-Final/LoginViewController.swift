//
//  LoginViewController.swift
//  AC3.2-Final
//
//  Created by John Gabriel Breshears on 2/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate, UIApplicationDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        configureConstraints()
        gesturesAndControls()
        view.backgroundColor = UIColor.white
        view.layoutIfNeeded()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    // MARK: - Setup
    func setupViewHierarchy() {
        self.view.addSubview(logo)
        self.view.addSubview(emailPasswordContainer)
        emailPasswordContainer.addSubview(emailTextField)
        emailPasswordContainer.addSubview(passwordTextField)
        self.view.addSubview(buttonContainer)
        buttonContainer.addSubview(loginButton)
        buttonContainer.addSubview(registerButton)
    }
    
    private func configureConstraints(){
        self.edgesForExtendedLayout = []
        
        // Logo
        logo.snp.makeConstraints({ (view) in
            view.centerX.equalTo(self.view)
            view.width.height.equalTo(150)
            view.top.equalToSuperview().offset(40)
        })
        // PasswordEmail Container
        emailPasswordContainer.snp.makeConstraints { (container) in
            container.width.equalTo(300)
            container.height.equalTo(55)
            container.top.equalTo(logo.snp.bottom).offset(70)
            container.centerX.equalTo(self.view)
        }
        // Email TextField
        emailTextField.snp.makeConstraints { (textField) in
            textField.leading.equalTo(emailPasswordContainer.snp.leading)
            textField.trailing.equalTo(emailPasswordContainer.snp.trailing)
            textField.top.equalTo(emailPasswordContainer.snp.top)
            textField.centerX.equalTo(emailPasswordContainer.snp.centerX)
        }
        // Password TextField
        passwordTextField.snp.makeConstraints { (textField) in
            textField.leading.equalTo(emailPasswordContainer.snp.leading)
            textField.trailing.equalTo(emailPasswordContainer.snp.trailing)
            textField.top.equalTo(emailTextField.snp.bottom).offset(15)
            //textField.centerX.equalTo(emailPasswordContainer.snp.centerX)
        }
        // Button Container
        buttonContainer.snp.makeConstraints { (container) in
            container.top.equalTo(emailPasswordContainer.snp.bottom).offset(20)
            container.centerX.equalTo(self.view)
            container.width.equalTo(300)
            container.height.equalTo(55)
        }
        //Login Button
        loginButton.snp.makeConstraints { (button) in
            button.leading.equalTo(buttonContainer.snp.leading).offset(70)
            button.top.equalTo(buttonContainer.snp.top)
        }
        // Register Button
        registerButton.snp.makeConstraints { (button) in
            button.trailing.equalTo(buttonContainer.snp.trailing).inset(75)
            button.top.equalTo(buttonContainer.snp.top)
        }
        
    }
    // MARK: - TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if !textField.text!.isEmpty {
            
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        if textField == emailTextField {
    //            print("Hello")
    //            emailTextField.resignFirstResponder()
    //        }
    //
    //        return true
    //    }
    
    
    
    
    
    // MARK: - Actions
    
    func gesturesAndControls(){
        loginButton.addTarget(self, action: #selector(tappedLoginButton(sender:)), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(tappedRegisterButton(sender:)), for: .touchUpInside)
    }
    
    //WOrks
    internal func tappedRegisterButton(sender: UIButton) {
        print("Touched for the first time")
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("cannot validate username/password")
            return
        }
        // FireBase Creatinga User
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            
            
            if error != nil {
                print(error!)
                
                let alertController = UIAlertController(title: "Registration failed", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                let defautAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                alertController.addAction(defautAction)
                self.present(alertController, animated: true, completion: nil)
                
                
            }
            
            if user != nil {
                
                let alertController = UIAlertController(title: "Welcome", message: "I, Gabriel Breshears, am delighted to welcome you to Meatly! ", preferredStyle: .alert)
                let defautAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                alertController.addAction(defautAction)
                self.present(alertController, animated: true, completion: nil)
                
                
                let feedAndUploadTab = UITabBarController()
                
                let feedViewController = FeedViewController()
                let uploadViewController = UploadViewController()
                //let loginViewController = LoginViewController()
                
                //Embedding Nav Contoller
                let feedNavigationController = UINavigationController(rootViewController: feedViewController)
                let uploadNavigationControllerr = UINavigationController(rootViewController: uploadViewController)
                
                // Gathering up all the Viewcontrollers and connecting them to the tabs?
                feedAndUploadTab.viewControllers = [feedNavigationController,uploadNavigationControllerr]
                
                // TabBar Images
                feedViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "chickenleg") , tag: 0)
                uploadNavigationControllerr.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "upload"), tag: 1)
                
                // Upload Navigation Bar  Color and Text
                uploadNavigationControllerr.navigationBar.barTintColor = UIColor.white
                uploadNavigationControllerr.navigationBar.topItem?.title = "Unit6Final-StaGram"
                // Feed Navigation Bar Color and Text
                feedNavigationController.navigationBar.barTintColor = UIColor.white
                feedNavigationController.navigationBar.topItem?.title = "Unit6Final-StaGram"
                
                //Not sure yet
                UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
                
                // Changes tabBar Color
                feedAndUploadTab.tabBar.barTintColor = UIColor.white
                
                
                UIApplication.shared.keyWindow?.rootViewController = feedAndUploadTab
                
                
                
            }
            
            
        }
    }
    
    //Tested! Login message works
    internal func tappedLoginButton(sender: UIButton) {
        
        
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("cannot validate username/password")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error!)
                
                let alertController = UIAlertController(title: "Login failed", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                let defautAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                alertController.addAction(defautAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
            if user != nil {
                
                let alertController = UIAlertController(title: "Login Success", message: "You Did it!", preferredStyle: .alert)
                let defautAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                alertController.addAction(defautAction)
                self.present(alertController, animated: true, completion: nil)
                
                
                
                
                let feedAndUploadTab = UITabBarController()
                
                let feedViewController = FeedViewController()
                let uploadViewController = UploadViewController()
                //let loginViewController = LoginViewController()
                
                //Embedding Nav Contoller
                let feedNavigationController = UINavigationController(rootViewController: feedViewController)
                let uploadNavigationControllerr = UINavigationController(rootViewController: uploadViewController)
                
                // Gathering up all the Viewcontrollers and connecting them to the tabs?
                feedAndUploadTab.viewControllers = [feedNavigationController,uploadNavigationControllerr]
                
                // TabBar Images
                feedViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "chickenleg") , tag: 0)
                uploadNavigationControllerr.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "upload"), tag: 1)
                
                // Upload Navigation Bar  Color and Text
                uploadNavigationControllerr.navigationBar.barTintColor = UIColor.white
                uploadNavigationControllerr.navigationBar.topItem?.title = "Unit6Final-StaGram"
                // Feed Navigation Bar Color and Text
                feedNavigationController.navigationBar.barTintColor = UIColor.white
                feedNavigationController.navigationBar.topItem?.title = "Unit6Final-StaGram"
                
                //Not sure yet
                UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
                
                // Changes tabBar Color
                feedAndUploadTab.tabBar.barTintColor = UIColor.white
                
                
                UIApplication.shared.keyWindow?.rootViewController = feedAndUploadTab
                
            }
        }
    }
    
    
    
    // MARK: - Lazy Init
    
    internal lazy var logo: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "meatly_logo")
        return imageView
    }()
    
    internal lazy var emailPasswordContainer: UIView = {
        var container = UIView()
        //container.backgroundColor = UIColor.white
        return container
    }()
    
    internal lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Email..."
        textField.backgroundColor = UIColor.lightGray
        textField.borderStyle = .line
        return textField
    }()
    
    internal lazy var passwordTextField: UITextField = {
        var textField: UITextField = UITextField()
        textField.placeholder = "Password..."
        textField.backgroundColor = UIColor.lightGray
        textField.borderStyle = .line
        return textField
    }()
    
    internal lazy var buttonContainer: UIView = {
        var  container: UIView = UIView()
        
        return container
    }()
    
    internal lazy var loginButton: UIButton = {
        var button: UIButton = UIButton()
        button.setTitle("LOGIN /", for: .normal)
        button.tintColor = UIColor.blue
        button.setTitleColor(UIColor.cyan, for: .normal)
        return button
    }()
    
    internal lazy var registerButton: UIButton = {
        var button: UIButton = UIButton()
        button.setTitle("REGISTER", for: .normal)
        button.setTitleColor(UIColor.cyan, for: .normal)
        return button
    }()
    
    
}
