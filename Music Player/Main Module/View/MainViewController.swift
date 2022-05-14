//
//  ViewController.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import UIKit
import AVFoundation
import MediaPlayer
class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!//Для связи с presentor

    
    @IBOutlet weak var trackText: UILabel!
    
    @IBOutlet weak var buttonStatus:UIButton!
    
    @IBOutlet weak var imageMusic: UIImageView!
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
        func setMusicName(musicName: String) {
            trackText.text = musicName
        }
        
        func setStatus(statusMusic: String){
            buttonStatus.setTitle(statusMusic, for: .normal)
        }
    }

