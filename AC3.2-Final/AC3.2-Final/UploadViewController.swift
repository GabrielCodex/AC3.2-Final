//
//  UploadViewController.swift
//  AC3.2-Final
//
//  Created by John Gabriel Breshears on 2/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
   
    var ref: FIRDatabaseReference!
    let picker = UIImagePickerController()
    var displayName = "Gabriel"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        configureConstraints()
        picker.delegate = self
        presentPicker()
        descriptionTextField.delegate = self
//        view.setNeedsLayout()
//        view.reloadInputViews()
        // Nav bar not appearing....
        navigationItem.rightBarButtonItem = doneBarButton
        
        configureDatabase()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Picker
    func presentPicker() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.uploadImageView.image = image
            cameraIcon.alpha = 0.0
        }
        self.dismiss(animated: true, completion: nil)
        //addPhotoToDB()
    }
    
    
    // MARK: - FireBase UPload
    
    func configureDatabase(){
        ref = FIRDatabase.database().reference()
    }
    
    func sendData(data: [String: String]) {
       var mdata = data
        mdata[Constants.MessageFields.userId] = displayName
        
        ref.child("ac-32-final").childByAutoId().setValue(mdata)
        //ac-32-final
    }
    
    // firing off twice. 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty {
            
            let data = [Constants.MessageFields.comment : textField.text! as String]
            
            sendData(data: data)
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    func gesturesAndControls(){
    
    
    }
    
    func doneBarButtonPressed() {
        
        let _ = textFieldShouldReturn(descriptionTextField)
        descriptionTextField.text = ""
        
    }
    
    
    
    // MARK: - Setup
    func setupViewHierarchy() {
        view.addSubview(uploadImageView)
        view.addSubview(descriptionTextField)
        uploadImageView.addSubview(cameraIcon)
    }
    
    private func configureConstraints(){
        self.edgesForExtendedLayout = []
        
        // ImageView
        uploadImageView.snp.makeConstraints { (image) in
            image.top.equalToSuperview()
            image.trailing.equalToSuperview()
            image.leading.equalToSuperview()
            image.height.equalToSuperview().dividedBy(1.5)
        }
        // Desription TextField
        descriptionTextField.snp.makeConstraints { (textfield) in
            textfield.top.equalTo(uploadImageView.snp.bottom).offset(7)
            textfield.bottom.equalToSuperview().inset(30)
            textfield.leading.equalToSuperview().offset(8)
            textfield.trailing.equalToSuperview().inset(8)
        }
        // cameraIcon
        cameraIcon.snp.makeConstraints { (icon) in
            icon.centerX.equalTo(uploadImageView.snp.centerX)
            icon.centerY.equalTo(uploadImageView.snp.centerY)
        }
        
    }
    
    // MARK: - Lazy Init
    
    internal lazy var uploadImageView: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    
    internal lazy var descriptionTextField: UITextField = {
        var textField: UITextField = UITextField()
        textField.placeholder = "Add a description..."
        textField.borderStyle = .line
        return textField
    }()
    internal lazy var cameraIcon: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "camera_icon")
        
       return imageView
    }()
    
    internal lazy var doneBarButton: UIBarButtonItem = {
        var button: UIBarButtonItem = UIBarButtonItem()
       
        button.image = #imageLiteral(resourceName: "chickenleg")
        button.style = .done
        button.target = self
        button.tintColor = UIColor.red
        button.action = #selector(doneBarButtonPressed)
        
        return button
    }()
    
    
    /*
 
     internal lazy var upArrow: UIBarButtonItem = {
     var barButtonItem = UIBarButtonItem()
     barButtonItem.image = #imageLiteral(resourceName: "up_arrow")
     barButtonItem.style = .plain
     barButtonItem.target = self
     barButtonItem.action = #selector(uploadButtonPressed)
     //barButtonItem.action = #selector(presentPic)
     //barButtonItem.action = #selector(showBlackScreen)
     barButtonItem.tintColor = EyeVoteColor.accentColor
     return barButtonItem
     }()
     
 
 */
    
    
    
    
}
