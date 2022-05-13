//
//  ViewController.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!//Для связи с presentor

    
    @IBOutlet weak var greetinLabel: UILabel!
    
    @IBOutlet weak var buttonStatus:UIButton!
    
    @IBAction func didTapActionButton(sender: UIButton){
        self.presenter.playAndStop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

//Создаём расширение для класса и подключаем к протоколу
extension MainViewController: MainViewProtocol{
        func setStatus(statusMusic: String){
            buttonStatus.setTitle(statusMusic, for: .normal)
        }
    }

