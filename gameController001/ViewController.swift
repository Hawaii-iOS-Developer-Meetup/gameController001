//
//  ViewController.swift
//  gameController001
//
//  Created by pair on 5/17/17.
//  Copyright © 2017 pair. All rights reserved.
//

import UIKit

import GameController

class ViewController: UIViewController {
    
    var _gameController = GCController()
    
    var timer = Timer()
    
    @IBOutlet weak var textView: UITextView!
    
    // Checks of controllers that are on and connected to the iPhone
    
    func checkForWirelessController() {
        
        GCController.startWirelessControllerDiscovery(completionHandler: ({

            GCController.stopWirelessControllerDiscovery()
            
        }))
    }
    
    // Set up the controller after it's been found and connected
    
    func gameControllerDidConnect() {
        
        writeToConsoleAndScreen("gameControllerDidConnect")
        
        // list out the controllers
        
        print(GCController.controllers())
        
        setGameController(withController: GCController.controllers()[0])
        
        textView.text = textView.text
        
        _gameController.gamepad?.valueChangedHandler = nil
        
        setupExtendedController(controller: _gameController)
    }
    
    func setupExtendedController( controller: GCController) {
        
        controller.extendedGamepad?.valueChangedHandler = { (gamepad, element) -> Void in
            
            /* //TODO: Update code to handle multiple game controllers
 
             // Check if there is more than one controller connected
             
             if (gamepad.controller?.playerIndex == .Index1){
             
                // this is player 1 using the controller
             
             } else {
                
                // this is player 2 using the controller
             }
             
             */
            
            //TODO: Update d pad controls as they are not working
            //TODO: Update print statements as they fire a ton at once.
            
            // dpad
            
            if element == self._gameController.extendedGamepad?.dpad.down {
                self.writeToConsoleAndScreen("you pressed DOWN on the d pad")
            }
            
            if element == self._gameController.extendedGamepad?.dpad.left {
                self.writeToConsoleAndScreen("you pressed LEFT on the d pad")
            }
            
            if element == self._gameController.extendedGamepad?.dpad.right {
                self.writeToConsoleAndScreen("you pressed RIGHT on the d pad")
            }
            
            if element == self._gameController.extendedGamepad?.dpad.up {
                self.writeToConsoleAndScreen("you pressed UP on the d pad")
            }
            
            // buttons
            
            if element == self._gameController.extendedGamepad?.buttonA {
                self.writeToConsoleAndScreen("you pressed buttonA")
            }
            
            if element == self._gameController.extendedGamepad?.buttonB {
                self.writeToConsoleAndScreen("you pressed buttonB")
            }
            
            if element == self._gameController.extendedGamepad?.buttonX {
                self.writeToConsoleAndScreen("you pressed buttonX")
            }
            
            if element == self._gameController.extendedGamepad?.buttonY {
                self.writeToConsoleAndScreen("you pressed buttonY")
            }
            
            // shoulder buttons
            
            if element == self._gameController.extendedGamepad?.leftShoulder {
                self.writeToConsoleAndScreen("you pressed leftShoulder")
            }
            
            if element == self._gameController.extendedGamepad?.rightShoulder {
                self.writeToConsoleAndScreen("you pressed rightShoulder")
            }
            
            // triggers
            
            if element == self._gameController.extendedGamepad?.leftTrigger {
                self.writeToConsoleAndScreen("you pressed leftTrigger")
            }
            
            if element == self._gameController.extendedGamepad?.rightTrigger {
                self.writeToConsoleAndScreen("you pressed rightTrigger")
            }
            
            // analog sticks
            
            if element == self._gameController.extendedGamepad?.leftThumbstick {
                self.writeToConsoleAndScreen("you pressed leftThumbstick")
            }
            
            if element == self._gameController.extendedGamepad?.rightThumbstick {
                self.writeToConsoleAndScreen("you pressed rightThumbstick")
            }
        }
    }

    func setGameController(withController inputGameController: GCController) {
        
        _gameController = inputGameController
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register to receive notification that controller has been found and connected
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.gameControllerDidConnect), name: .GCControllerDidConnect, object: nil)
        
        checkForWirelessController()
    }
}

extension ViewController {
    
    func writeToConsoleAndScreen(_ inputText: String) {
        
        print(inputText)
        
        textView.text.append(inputText)
        
        textView.text.append("\n")
        
        let range = NSMakeRange(textView.text.characters.count - 1, 0)
        
        textView.scrollRangeToVisible(range)
    }
}











