//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Skander Thabet on 26/2/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    let storyPrompt = StoryPromptEntry()
    
    //TextFields
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    //Slider
    @IBOutlet weak var numberSlider: UISlider!
    //Number label
    @IBOutlet weak var numberLB: UILabel!
    
    
    //Event actions
    @IBAction func changedNumber(_ sender: UISlider) {
        numberLB.text="Number : \(Int(sender.value))"
        storyPrompt.number=(Int(sender.value))
    }
    @IBAction func changedStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex){
            storyPrompt.genre = genre
        }
        else {
            storyPrompt.genre = .scifi
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberSlider.value=7.5
        storyPrompt.number=(Int(numberSlider.value))
    }


}

