//
//  ViewController.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var greetinLabel: UILabel!
    
    var presenter: MainViewpPresenterProtocol!//Для связи с presentor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapActionButton( sender: Any){
        self.presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol{
        func setGreeting(greeting: String){
            self.greetinLabel.text = greeting
        }
    }

