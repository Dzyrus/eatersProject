//
//  rateViewController.swift
//  course 2 main proj
//
//  Created by Daria on 09/08/2019.
//  Copyright © 2019 D.Misch. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    @IBOutlet weak var brilliantButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var ratingStackView: UIStackView!
    var restRating: String?
    @IBAction func rateRestaurant(_ sender: UIButton) {
        switch sender.tag {
        case 0: restRating = "bad"
        case 1: restRating = "good"
        case 2: restRating = "brilliant"
        default: break
        }
        
        performSegue(withIdentifier: "unwindSegueToDVC", sender: sender)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.4) {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }
        let buttonArray = [badButton, goodButton, brilliantButton]
        for (index, button) in buttonArray.enumerated() {
            let delay = Double(index) * 0.2
            UIView.animate(withDuration: 0.6, delay: delay, options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        // Do any additional setup after loading the view.
        //let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
