//
//  MakeANumberViewController.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 29.04.2022.
//

import UIKit

class MakeANumberViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func readNumberButton(_ sender: Any) {
        var isWin = true
        guard let readNumber = Int(dataTextField.text ?? "") else
        { isWin = false
            showAlert(message: "Введенные данные не являются числом")
            return }
        if readNumber < 1 || readNumber > 100 {
            isWin = false
            showAlert(message: "Ваш вариант не укладывается в диапазон загадываемого числа")
        }

        if isWin {
            
            EventHistory.shared.enteredNumber = readNumber
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "GuesstheNumberViewController") as? GuesstheNumberViewController else {return}
            show(viewController as UIViewController, sender: nil)
        }

    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ввести число заново", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
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
