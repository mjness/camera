//
//  ViewController.swift
//  Camera
//
//  Created by Michael Ness on 9/16/15.
//  Copyright © 2015 Michael Ness. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myimage: UIImageView!
    @IBAction func captureButtonPressed(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .Camera
            imagePickerController.allowsEditing = false
         
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        self.myimage.image = nil
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.myimage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

