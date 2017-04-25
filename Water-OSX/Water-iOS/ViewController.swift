//
//  ViewController.swift
//  Water-iOS
//
//  Created by Xue Yu on 4/24/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import UIKit
import MetalKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    var renderer: Renderer!
    let imagePickerController = UIImagePickerController()
    var navigationBarStatus = false

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let metalView = self.view as! MTKView
        renderer = Renderer(mtkView: metalView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        metalView.addGestureRecognizer(tap)
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleTap(){
        navigationBarStatus = !navigationBarStatus
        self.navigationController?.setNavigationBarHidden(navigationBarStatus, animated: true)
    }
    
    @IBAction func cameraButtonDidClick(_ sender: UIBarButtonItem) {
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.image"]
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //obtaining saving path
        let fileManager = FileManager.default
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let imagePath = documentsPath?.appendingPathComponent("image.jpg")
        
        // extract image from the picker and save it
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            try! UIImageJPEGRepresentation(pickedImage, 0.0)?.write(to: imagePath!)
        }
        
        renderer.changeTexture(imageURL: imagePath!)
        self.dismiss(animated: true, completion: nil)
    }

    

}

