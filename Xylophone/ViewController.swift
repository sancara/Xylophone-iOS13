//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        let nota  = sender.titleLabel?.text
        sender.alpha = 0.5
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    //Bring's sender's opacity back up to fully opaque.
                    sender.alpha = 1.0
                }

        playSound(note: nota!)
        
    }
    
    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}

