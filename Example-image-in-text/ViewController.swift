//
//  ViewController.swift
//  Example-image-in-text
//
//  Created by Rodrigo De Luca on 25/7/15.
//  Copyright (c) 2015 iOS Makers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5

        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        
        
        label.attributedText = generateText(" Like us!", withImageName: "image1")

        button.setAttributedTitle(generateText(" Cool!", withImageName: "image2"), for: .normal)
    }

    func generateText(_ text:String, withImageName image: String) -> NSAttributedString? {

        /* attach image */
        let imageForText = NSTextAttachment()
        imageForText.image = UIImage(named: image)
        
        /* dictionary with attributes */
        let textAttributes = [NSForegroundColorAttributeName:UIColor.white,
                              NSFontAttributeName:UIFont.systemFont(ofSize: 15)]

        /* add attributes to text */
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: imageForText))
        attributedString.append(NSAttributedString(string: text, attributes: textAttributes))
        
        /* set vertical aligment for text */
        let range = NSMakeRange(1, text.characters.count)
        attributedString.addAttribute(NSBaselineOffsetAttributeName, value: 8.0, range: range);
        
        return attributedString
    }
}

