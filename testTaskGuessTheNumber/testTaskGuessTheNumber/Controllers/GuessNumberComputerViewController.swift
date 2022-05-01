//
//  GuessNumberComputerViewController.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 01.05.2022.
//

import UIKit

class GuessNumberComputerViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    @IBAction func computerValueButton(_ sender: Any) {
    
        let guessedNumber = EventHistory.shared.guessedNumber
        let binValue = EventHistory.shared.binValue()
        label2.text = "Компьютер называет число \(binValue)"
        
        if binValue < guessedNumber {
            EventHistory.shared.leftBorder = binValue
            EventHistory.shared.attemptNumberComputer += 1
            label.text = "Загаданное число больше"
        }
        if binValue > guessedNumber {
            EventHistory.shared.rightBorder = binValue
            EventHistory.shared.attemptNumberComputer += 1
            label.text = "Загаданное число меньше"
        }
        if binValue == guessedNumber {
            
            EventHistory.shared.attemptNumberComputer += 1
            let alert = UIAlertController(title: "Внимание", message: "Компьютер угадал число, ему потребовалось \(EventHistory.shared.attemptNumberComputer) попыток", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Перейти к сравнению результатов", style: .default) { (action) in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "WinnerViewController") as? WinnerViewController else {return}
                self.show(viewController as UIViewController, sender: nil)
                
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
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
