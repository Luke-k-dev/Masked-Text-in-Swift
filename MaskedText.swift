//
//  MaskedText.swift
//
//  Created by Lucas Klein on 5/22/18.
//  Copyright © 2018 Lucas Klein. All rights reserved.
//

import UIKit

import UIKit
final class MaskLabel UIView {

    var messageLabel: UILabel!
    
    var maskLayer: UIImageView!
    
    @IBInspectable var text: String? {
    get { return messageLabel?.text }
    set { messageLabel?.text = newValue }
    }
    
    
    @IBInspectable var bold: Bool {
        get { return messageLabel?.font.isBold ?? false}
        set {
            let tempsize = messageLabel.font.pointSize
            if(newValue){
                messageLabel.font = UIFont.boldSystemFont(ofSize: tempsize)
            }else{
                messageLabel.font = UIFont.systemFont(ofSize: tempsize)
            }
        }
    }
    @IBInspectable var centertext: Bool {
        get {
            if(messageLabel.textAlignment == .center){
                return true
            }
            return false
        }
        set {
            if(newValue){
                messageLabel.textAlignment = .center
            }else{
                messageLabel.textAlignment = .left
            }
        }
    }
    
    @IBInspectable var fontsize: CGFloat{
        get { return (messageLabel?.font.pointSize ?? 2) }
        set {
            if(bold){
                 messageLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(newValue))
            }else{
                 messageLabel?.font = UIFont.systemFont(ofSize: CGFloat(newValue))
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        messageLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        maskLayer = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        drawmask()
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //print("init from decoder")
        
        messageLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        maskLayer = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        drawmask()
    }
    func drawmask(){
        messageLabel.numberOfLines = 99
        maskLayer.image = UIImage.init(named: "textmask.png")
        //print(maskLayer.image)
        //messageLabel.font = UIFont.boldSystemFont(ofSize: 30)
        messageLabel.text = text
        maskLayer.mask = messageLabel
        self.addSubview(maskLayer)
        self.setNeedsLayout()
        setNeedsDisplay()
    }
    
}

extension UIFont {
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
}
