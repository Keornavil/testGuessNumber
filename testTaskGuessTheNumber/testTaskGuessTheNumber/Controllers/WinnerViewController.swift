//
//  WinnerViewController.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 01.05.2022.
//

import UIKit

class WinnerViewController: UIViewController {
    
    
    @IBOutlet weak var resultsOfUser: UILabel!
    
    @IBOutlet weak var resultsOfComputer: UILabel!
    
    @IBOutlet weak var resultGame: UILabel!
    @IBAction func resultsButton(_ sender: Any) {
        resultsOfUser.text = "Игрок отгадал число за \(EventHistory.shared.attemptNumberUser) попытки"
        resultsOfComputer.text = "Компьютер отгадал число  за \(EventHistory.shared.attemptNumberComputer) попытки"
        if EventHistory.shared.attemptNumberComputer < EventHistory.shared.attemptNumberUser {
            resultGame.text = "Победил компьютер"
        }
        if
            EventHistory.shared.attemptNumberUser < EventHistory.shared.attemptNumberComputer {
                resultGame.text = "Победил игрок"
        } else {
            resultGame.text = "Ничья"
        }
            
    }
    @IBAction func restartGameButton(_ sender: Any) {
        EventHistory.shared.defaultValue()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else {return}
        show(viewController as UIViewController, sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
