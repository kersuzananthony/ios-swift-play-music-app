//
//  ViewController.swift
//  back to bach
//
//  Created by Kersuzan on 29/09/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Set the player variable
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet var volume: UISlider!
    
    @IBOutlet var srub: UISlider!
    
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.play()
        
        // Set up the audio path
        let audioPath = NSBundle.mainBundle().pathForResource("college", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            player.volume = volume.value
        } catch let error as NSError {
            print(error.debugDescription)
        }

        
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volume.value
        
    }
    
    @IBAction func changeScrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(srub.value)
        
    }
    
    func updateScrub() {
        
        srub.value = Float(player.currentTime)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up the audio path
        let audioPath = NSBundle.mainBundle().pathForResource("college", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            
            // Initialize the scrub max value
            srub.maximumValue = Float(player.duration)
            
            // Update the timer every second
            _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrub"), userInfo: nil, repeats: true)
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

