//
//  http://kyivapp.com
//  http://iashchuk.com
//  ClientSignatureView.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//  Application version 0.7.1, build 3
//  Last modification on 2017.12.11
//
//   App precisely handcrafted in KyivApp Development Studio
//  File created by Alexander Iashchuk on 10/12/17
//  Copyright © 2017 iashchuk.com
//  Alexander Iashchuk (iAlexander)
//  All rights reserved
//


import UIKit
Finished the signature view class
public struct Signature {
    
    private(set) public var image : UIImage
    private(set) public var date  : Date
    
    init(signature: UIImage) {
        self.image = signature
        self.date = Date()
    }
}

public protocol SignatureViewDelegate: class {
    func SignatureViewDidCaptureSignature(view: SignatureView, signature: Signature?)
    func SignatureViewDidBeginDrawing(view: SignatureView)
    func SignatureViewIsDrawing(view: SignatureView)
    func SignatureViewDidFinishDrawing(view: SignatureView)
    func SignatureViewDidCancelDrawing(view: SignatureView)
}

extension SignatureViewDelegate {
    
    func SignatureViewDidCaptureSignature(view: SignatureView, signature: Signature?) {
        //optional
    }
    
    func SignatureViewDidBeginDrawing(view: SignatureView) {
        //optional
    }
    
    func SignatureViewIsDrawing(view: SignatureView) {
        //optional
    }
    
    func SignatureViewDidFinishDrawing(view: SignatureView) {
        //optional
    }
    
    func SignatureViewDidCancelDrawing(view: SignatureView) {
        //optional
    }
}
