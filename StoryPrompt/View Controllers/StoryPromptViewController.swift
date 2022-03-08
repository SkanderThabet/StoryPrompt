//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Skander Thabet on 1/3/2022.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPrompt_tv: UITextView!
    
    var storyPrompt : StoryPromptEntry?
    var isNewStoryPrompt = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
        
        
        storyPrompt_tv.text = storyPrompt?.description 
    }
    

    @objc func cancelStoryPrompt() {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    @objc func saveStoryPrompt() {
        NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPrompt)
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
    
}
extension Notification.Name {
    static let StoryPromptSaved = Notification.Name("StoryPromptSave")
}
