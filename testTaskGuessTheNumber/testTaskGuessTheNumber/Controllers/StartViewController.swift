//
//  StartViewController.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 29.04.2022.
//

//
//  ViewController.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 29.04.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBAction func startGameButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if EventHistory.shared.guesser == 0 {
            EventHistory.shared.guessedNumber = Int.random(in: 1...100)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "MakeANumberViewController") as? MakeANumberViewController else {return}
            show(viewController as UIViewController, sender: nil)
        } else {
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "RidderViewController") as? RidderViewController else {return}
            show(viewController as UIViewController, sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
