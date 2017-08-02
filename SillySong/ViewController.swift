//
//  ViewController.swift
//  SillySong
//
//  Created by Christian Villere on 7/29/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!) }
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


func shortNameFromName(name: String) -> String {
    var shortName = name.lowercased()
    let newString = shortName
    let vowels: [Character] = ["a", "e", "i", "o", "u"]
    for i in shortName.characters {
        if vowels.contains(i) {
            break
        } else {
            shortName = shortName.replacingOccurrences(of: "\(i)", with: "")
        }
    }
    if shortName != "" {
        return shortName
    } else {
        return newString
    }
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let Template = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    let Template_Two = Template.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    return Template_Two
    
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
