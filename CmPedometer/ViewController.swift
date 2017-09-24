//
//  ViewController.swift
//  CmPedometer
//
//  Created by Baran on 24.09.2017.
//  Copyright © 2017 Brainilission. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func runButtonAction(_ sender: Any) {
        
        if pedemoterStarted {
            self.stopCounting()
            pedemoterStarted = !pedemoterStarted
            self.runButton.setTitle("RUN", for: .normal)
            self.stepsLabel.text = "0"
            self.distanceLabel.text = "0 m"
        }
        else{
            self.startCounting()
            pedemoterStarted = !pedemoterStarted
            self.runButton.setTitle("STOP", for: .normal)
        }
        
    }
   
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var runButton: CircleUIButton!
    

    let pedometer   = CMPedometer()
    let lengthFormatter = LengthFormatter()
    var pedemoterStarted : Bool = false

}

extension ViewController {
    
    func startCounting() {
        let date = Date()
        if CMPedometer.isStepCountingAvailable() {
            self.pedometer.startUpdates(from: date) { (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil) {
                        print("\(data!.numberOfSteps)")
                        let distance = data!.distance?.doubleValue
                        let steps = data!.numberOfSteps.doubleValue
                        
                        self.stepsLabel.text = String(steps)
                        self.distanceLabel.text = self.lengthFormatter.string(fromMeters: distance!)

                        
                    } else {
                        print("Pedometer error \(String(describing: error))")
                    }
                })
            }
        } else {
            print("Pedometer is not available")
        }
    }
    
    func stopCounting() {
        self.pedometer.stopUpdates()
    }
}
