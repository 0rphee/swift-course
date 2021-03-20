//
//  ViewController.swift
//  cuarzo papiro navaja
//
//  Created by roger on 25/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updatingView(GameState: .start)
    }
    
//--------------OUTLETS--------------
    //  Icon OUTLET
        @IBOutlet weak var appIcon: UILabel!
    //  Status OUTLET
        @IBOutlet weak var statusOutlet: UILabel!
    //  Scissors OUTLET
        @IBOutlet weak var scissorsOutlet: UIButton!
    //  Rock OUTLET
        @IBOutlet weak var rockOutlet: UIButton!
    //  Paper OUTLET
        @IBOutlet weak var paperOutlet: UIButton!
    // Play Again OUTLET
    @IBOutlet weak var playAgainOutlet: UIButton!
    
    
//--------------ACTIONS--------------

    // Scissors ACTION
        @IBAction func scissorsAction(_ sender: Any) {
            play(playerSign: .scissors)
        }
    // Rock ACTION
        @IBAction func rockAction(_ sender: Any) {
            play(playerSign: .rock)
        }
    // Paper ACTION
        @IBAction func paperAction(_ sender: Any) {
            play(playerSign: .paper)
        }
    // Play Again ACTION
        @IBAction func playAgainAction(_ sender: Any) {
            updatingView(GameState: .start)
        }
//====================================
    func updatingView(GameState: GameState) {
        switch GameState {
        case .start:
            appIcon.text = "🤖"
            
            statusOutlet.text = "Rock, paper or scissors?"
            
            scissorsOutlet.isEnabled = true
            rockOutlet.isEnabled = true
            paperOutlet.isEnabled = true
            
            scissorsOutlet.isHidden = false
            rockOutlet.isHidden = false
            paperOutlet.isHidden = false
            
            playAgainOutlet.isHidden = true
        case .draw:
            
            statusOutlet.text = "Almost there"
            
            scissorsOutlet.isEnabled = false
            rockOutlet.isEnabled = false
            paperOutlet.isEnabled = false
            
            scissorsOutlet.isHidden = true
            rockOutlet.isHidden = true
            paperOutlet.isHidden = true
            
            playAgainOutlet.isHidden = false
        case .win:
            statusOutlet.text = "guauu"
            scissorsOutlet.isEnabled = false
            rockOutlet.isEnabled = false
            paperOutlet.isEnabled = false
            scissorsOutlet.isHidden = true
            rockOutlet.isHidden = true
            paperOutlet.isHidden = true
            playAgainOutlet.isHidden = false
        case .lose:
            
            statusOutlet.text = "lol you're bad"
            
            scissorsOutlet.isEnabled = false
            rockOutlet.isEnabled = false
            paperOutlet.isEnabled = false
            
            scissorsOutlet.isHidden = true
            rockOutlet.isHidden = true
            paperOutlet.isHidden = true
            
            playAgainOutlet.isHidden = false
        }
    }
//====================================
    func play(playerSign:Sign) {
        let rndmSign = randomSign()
        updatingView(GameState: playerSign.compare(randomSign: rndmSign))
        
        appIcon.text = rndmSign.emoji
        rockOutlet.isHidden = true
        rockOutlet.isEnabled = false
        
        scissorsOutlet.isHidden = true
        scissorsOutlet.isEnabled = false
        
        paperOutlet.isHidden = true
        paperOutlet.isEnabled = false
        switch playerSign {
        case .paper:
            paperOutlet.isHidden = false
        case .rock:
            rockOutlet.isHidden = false
        case .scissors:
            scissorsOutlet.isHidden = false
        }
    }
}

