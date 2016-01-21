//
//  ViewController.swift
//  AVAudioPlayerTesOne
//
//  Created by Fabio De Lorenzo on 1/9/16.
//  Copyright © 2016 Crokky Software Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var mPlayer:AVPlayer!
    var myTimer: NSTimer!
    let mUrl = "http://audio.radio24.ilsole24ore.com/radio24_audio/2016/160114-lazanzara-s.mp3"
    
    @IBOutlet var sliderController: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mPlayer = self.setupAudioPlayerWithFile(mUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        print ("pause button")
        mPlayer.pause()
        myTimer.invalidate()
    }
    @IBAction func playkButton(sender: AnyObject) {
        print ("play button")
        //backgroundMusic?.volume = 0.3
        mPlayer.play()
        myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "checkProgress", userInfo: nil, repeats: true)
        //NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "checkProgress", userInfo: nil, repeats: true)
    }
    
    func checkProgress() {
        if ( mPlayer != nil) {
            let duration = mPlayer.currentItem?.asset.duration
            let elapsed = mPlayer!.currentItem?.currentTime()
            print("check prodgress " + String(elapsed) + "/" + String(duration) )
            let percentage = Float(CMTimeGetSeconds(elapsed!)/CMTimeGetSeconds(duration!) )
            print("check prodgress perc:" + String(percentage) )
            sliderController.setValue(percentage, animated: true)
        }

    }
    
    func setupAudioPlayerWithFile(mUrl: String) -> AVPlayer?  {

        let steamingURL:NSURL = NSURL(string:mUrl)!
        var player: AVPlayer!
        player = AVPlayer(URL: steamingURL)
        return player
    }

}

