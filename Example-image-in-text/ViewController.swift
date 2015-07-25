//
//  ViewController.swift
//  Example-image-in-text
//
//  Created by Rodrigo De Luca on 25/7/15.
//  Copyright (c) 2015 iOS Makers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.layer.masksToBounds = true
        self.label.layer.cornerRadius = 5

        self.button.layer.masksToBounds = true
        self.button.layer.cornerRadius = 5
        
        
        self.label.attributedText = self.generateText(text: " Like us!", withImage: "image1")


        self.button.setAttributedTitle(self.generateText(text: " Cool!", withImage: "image2"), forState: UIControlState.Normal)
        
    }

    
    func generateText(#text:String,withImage image: String) -> NSAttributedString? {

        /* attach image */
        var imageForText = NSTextAttachment()
        imageForText.image = UIImage(named: image)
        
        /* dictionary with attributes */
        let textAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),
                              NSFontAttributeName:UIFont.systemFontOfSize(15)]

        /* add attributes to text */
        var attributedString = NSMutableAttributedString()
        attributedString.appendAttributedString(NSAttributedString(attachment: imageForText))
        attributedString.appendAttributedString(NSAttributedString(string: text, attributes: textAttributes))
        
        /* set vertical aligment for text */
        let range = NSMakeRange(1, count(text))
        attributedString.addAttribute(NSBaselineOffsetAttributeName, value: 8.0, range: range);
        
        return attributedString
    }
}

