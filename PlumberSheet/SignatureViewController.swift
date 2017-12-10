//
//  http://kyivapp.com
//  http://iashchuk.com
//  SignatureViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//  Application version 0.7.1, build 1
//  Last modification on 2017.12.11
//
//   App precisely handcrafted in KyivApp Development Studio
//  File created by Alexander Iashchuk on 9/12/17
//  Copyright © 2017 iashchuk.com
//  Alexander Iashchuk (iAlexander)
//  All rights reserved
//


import UIKit

class ViewController: UIViewController, SignatureViewDelegate {
    
    @IBOutlet weak var signatureView: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        signatureView.delegate = self
    }

    @IBAction func CaptureSignatureButton(_ sender: Any) {
        signatureView.captureSignature()
    }
    
    func SignatureViewDidCaptureSignature(view: SignatureView, signature: Signature?) {
        if signature != nil {
            print(signature!)
            signatureView.clearCanvas()
        } else {
            if signatureView.signaturePresent == false {
                print("Signature is blank")
            } else {
                print("Failed to Capture Signature")
            }
        }
    }
    
    func SignatureViewDidBeginDrawing(view: SignatureView) {
        print("Began drawing Signature")
    }
    
    func SignatureViewIsDrawing(view: SignatureView) {
        print("Is drawing Signature")
    }
    
    func SignatureViewDidFinishDrawing(view: SignatureView) {
        print("Did finish drawing Signature")
    }
    
    func SignatureViewDidCancelDrawing(view: SignatureView) {
        print("Did cancel drawing signature")
    }
}
