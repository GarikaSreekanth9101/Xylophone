//
//  ViewController.swift
//  Xylophone
//
//  Created by Garika Sreekanth on 15/12/20.
//  Copyright © 2020 Garika Sreekanth. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var player:AVAudioPlayer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton)
    {
        playSound(soundName: sender.currentTitle!)
        
        
        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        if url != nil {
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        } else {
            print("Doesn’t contain a value.")
        }
    }
}


