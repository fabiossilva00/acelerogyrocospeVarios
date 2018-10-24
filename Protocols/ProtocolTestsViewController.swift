//
//  ProtocolTestsViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 24/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class ProtocolTestsViewController: UIViewController{

    @IBOutlet weak var protocolButton: UIButton!
    @IBOutlet weak var protocolSwitch: UISwitch!
    
    let racers: [Racer] = [UnladenSwallow.african, UnladenSwallow.european, UnladenSwallow.unknown, Penguin(name: "Pingu"), SwiftBird(version: 4.0), FlappyBird(name: "Flapping", flappyAmplitude: 1.0, flappyFrequency: 2.0), Motorcycle(name: "Moto?")]
    
    func testProtocol() {
        
        let nome = Pessoa()
        print(nome.fullName)
        
    }
    
    func printProtocols() {
        
        printAlgoParametro(parametro: "Algo")
        print(printAlgoParametroRetorna(parametro: "Algo 2"))
        ProtocolTestsViewController.printAlgoStatico(algoParametro: "1", "2", "3")
        
    }
    
    func retangulo() {
        
        var myRecta = Rectangle(width: 1, height: 1)
        myRecta.scaleBy(value: 5)
        print(myRecta.area())
        
    }
    
    func weaponsCreate() {
        
        let agulha = longSword(name: "Agulha", steel: "Lunar Steel")
        print(agulha.canFire)
        print(agulha.canCut)
        
        let howitzer = Howitzer()
        print(howitzer)
        
    }
    
    func racingProtocol() {
        
        let flappyBird = FlappyBird(name: "flappyBird", flappyAmplitude: 1.0, flappyFrequency: 2.0)
        print(flappyBird.canFly)
        
        let penguin = Penguin(name: "Penguin")
        print(penguin.canFly)
        
        let swift = SwiftBird(version: 4.0)
        print(swift.name)
        
        let swallow = UnladenSwallow.african
        print(swallow)
        print(swallow.canFly)
        
    }
    
    func numerosSlice() {
        
        let numbers = [10, 20, 30, 40, 50, 60]
        let slice = numbers[1...3]
        let reversedSlice = slice.reversed()
        
        let answer = reversedSlice.map{ $0 }
        print(answer)
        
    }
    
    func racersFunc() {
        let racers: [Racer] = [UnladenSwallow.african, UnladenSwallow.european, UnladenSwallow.unknown, Penguin(name: "Pingu"), SwiftBird(version: 4.0), FlappyBird(name: "Flapping", flappyAmplitude: 1.0, flappyFrequency: 2.0), Motorcycle(name: "Moto?")]
        print(racers)
        
    }
    
//    func topSpeed(of racers: [Racer]) -> Double {
//
//        return racers.max(by: {
//            $0.speed < $1.speed
//        })?.speed ?? 0
//
//    }
    
    func topSpeed<RacerType: Sequence>(of racers: RacerType) -> Double where RacerType.Iterator.Element == Racer {
        
        return racers.max(by: {
            $0.speed < $1.speed
        })?.speed ?? 0
    }
    
    func racingScore(){
        let score = RacingScore(value: 100) >= RacingScore(value: 150)
        print(score)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testProtocol()
//        printProtocols()
//        retangulo()
//        weaponsCreate()
//        racingProtocol()
//        numerosSlice()
//        racers()
//        print(topSpeed(of: racers))
//        print(topSpeed(of: racers[1...3]))
        racingScore()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
