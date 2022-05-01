//
//  GuesstheNumberViewController.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 29.04.2022.
//

import UIKit

class GuesstheNumberViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBAction func compareButton(_ sender: Any) {
        
        EventHistory.shared.compareValue(label: label)
        showAlert(message: label.text!)
        
        
    }
    
    func showAlert(message: String) {
        var titleAction: String {
            if EventHistory.shared.enteredNumber != EventHistory.shared.guessedNumber  {
                return("Ввести число заново")
            } else { return("Дождаться ответа противника")}
        }
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: titleAction, style: .default) { (action) in
            if EventHistory.shared.enteredNumber != EventHistory.shared.guessedNumber {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "MakeANumberViewController") as? MakeANumberViewController else {return}
                self.show(viewController as UIViewController, sender: nil)
            }
            
            if EventHistory.shared.enteredNumber == EventHistory.shared.guessedNumber {
                EventHistory.shared.guesser = 1
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else {return}
                self.show(viewController as UIViewController, sender: nil)
            } }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            //label.text = "\(readNumberUser)"
            
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
