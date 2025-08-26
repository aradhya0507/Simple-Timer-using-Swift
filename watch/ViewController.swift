//
//  ViewController.swift
//  watch
//
//  Created by SDC-USER on 05/08/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hourCounter: UILabel!
    @IBOutlet weak var minCounter: UILabel!
    @IBOutlet weak var secCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var timer : Timer!
    var seconds = 00
    @IBAction func startButton(_ sender: Any) {
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                }
            
        }
    
    @objc func updateTimer() {
        seconds += 1
        _ = String(format: "%02d", seconds)
        updateLables( )

    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        timer?.invalidate()
        seconds = 0
        secCounter.text = "00"
        minCounter.text = "00"
        timer = nil
    }
    
    func updateLables() {
        let minutes = seconds / 60
        let sec = seconds % 60
        let hours = minutes / 60
        secCounter.text = String(format: "%02d", sec)
        minCounter.text = String(format: "%02d", minutes)
        hourCounter.text = String(format: "%02d", hours)
    }
}

