//
//  CardSelectionVC.swift
//  Card Workout
//
//  Created by Klim Krivoguzov on 02.11.2022.
//

import UIKit

class CardSelectionVC: UIViewController {

    var timer: Timer!
    var cards: [UIImage] = Card.allValues
    @IBOutlet weak var CardsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(showRandImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandImage(){
        CardsView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func restartButton(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
