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
    var player: AVAudioPlayer?
    
    @IBOutlet weak var greetinLabel: UILabel!
    
    @IBAction func didTapActionButton(sender: UIButton){
        if let player = player, player.isPlaying {
            //stop
            player.stop()
        }
        else
        {
            let urlString = Bundle.main.path(forResource: "PHARAOH", ofType: "mp3")
            //play
            do
            {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

                guard let player = player else {
                    return
                }
                player.play()
            }
            catch
            {
                print("error")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

//Создаём расширение для класса и подключаем к протоколу
extension MainViewController: MainViewProtocol{
        func setGreeting(greeting: String){
            self.greetinLabel.text = greeting
        }
    }

