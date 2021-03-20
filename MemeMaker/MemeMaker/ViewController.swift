//
//  ViewController.swift
//  MemeMaker
//
//  Created by roger on 26/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        labeling()
    }
//=================================
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
//=================================
    @IBAction func segmentedControls(_ sender: Any) {
        labeling()
    }
//=================================
    let topChoices = [CaptionOption(emoji: "🕶", caption: "You know what's cool?"),CaptionOption(emoji: "💥", caption: "You know what makes me mad"),CaptionOption(emoji: "🤍", caption: "You know what I love")]
    let bottomChoices = [CaptionOption(emoji: "🐱", caption: "Cats wearing hats"),CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"),CaptionOption(emoji: "🐒", caption: "Monkeys being funky")]

    func labeling() {
            topCaptionLabel.text = topChoices[topCaptionSegmentedControl.selectedSegmentIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomCaptionSegmentedControl.selectedSegmentIndex].caption
    }
}

