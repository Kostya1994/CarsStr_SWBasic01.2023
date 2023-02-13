//
//  main.swift
//  CarsStr_SWBasic01.2023
//
//  Created by Константин Соловьев on 3.2.23..
//

import Foundation

//MARK: 1

//2) Структура TrunkCar

enum state{
    case opened
    case closed
}
enum engineState{
    case started
    case stoped
}
enum baggage : Double{
    case bag = 10
    case suitcase = 25
    case fridge = 100
    case closet = 60
    case furniture = 200
}



struct SportCar{
    let model: String
    let age: Int
    let color: String
    let wheels : Int
    let windows : Int
    let doors : Int
    let speedMax : Int
    var speedDifference : Int
    let trunkVolumeMax : Double
    private var freeTrunkVolume : Double {
        didSet{
            print("-------------------")
            print("New freeTrunkVolum = \(freeTrunkVolume)")
            return
        }
    }
    var myBaggageInTrunk : [baggage]{
        didSet{
            print("-------------------")
            print("Update staff in the trunk = \(myBaggageInTrunk)")
            return
        }
    }
    var windowsState : state
    var autoEngine : engineState
    private var speed : Int {
        willSet{
            return speedDifference = Int(sqrt(pow(Double(newValue - speed),2)))
        }
        didSet{
            print("-------------------")
            print("Old value = \(oldValue)")
            print("New value = \(speed)")
            return print(" 'Speed difference' was changed = \(speedDifference)")
        }
    }
    //doors could be opened and closed. It depends on the autoEngine value
    var doorsState : state
    {
        get {
            if autoEngine == .started {
                print("Doors are blocked, becouse engine is \(autoEngine)")
                return .opened
            }else{
                print("Doors are unblocked, becouse engine is \(autoEngine)")
                return .closed
            }
        }
    }
    
    init(model: String, age: Int, color: String,speedMax: Int, trunkVolumeMax: Double, windowsState: state) {
        self.model = model
        self.age = age
        self.color = color
        self.wheels = 4
        self.windows = 2
        self.doors = 3
        self.myBaggageInTrunk = []
        self.speedMax = speedMax
        self.trunkVolumeMax = trunkVolumeMax
        self.windowsState = windowsState
        self.autoEngine = .stoped
        self.speed = 0
        self.speedDifference = 0
        self.freeTrunkVolume = trunkVolumeMax
    }
    
    func printDoorsState(){
        print("-------------------")
        print("doorsState = \(doorsState)")
        print("windowsState = \(windowsState)")
        print("-------------------")
    }
    
    
    mutating func carSpeed(_ newSpeed: Int){
        self.speed = newSpeed
        if self.speed > 0 {
            self.autoEngine = .started
            print("The car is going, the speed is = \(self.speed)")
        }else{
            self.autoEngine = .stoped
            print("The car has stoped, the speed is = \(self.speed)")
        }
    }
    
    mutating func putInTrunk(yourBaggage newBaggage: baggage, amount: Int){
        var i = 0
        while i < amount {
            if self.freeTrunkVolume - newBaggage.rawValue > 0{
                self.myBaggageInTrunk.append(newBaggage)
                self.freeTrunkVolume -= newBaggage.rawValue
                print("Cool. We put \(newBaggage) in car's trunk")
                i += 1
            }else{
                print("There is no place. Your \(newBaggage) = \(newBaggage.rawValue) but free volume is \(self.freeTrunkVolume)")
            }
        
        }
    }
    //дать возможность вносить массив данных (вещей)
    mutating func getFromTrunk(_ baggageFromTrunk: baggage){
        if self.myBaggageInTrunk.count > 0 {
            for i in (0..<self.myBaggageInTrunk.count){
                if self.myBaggageInTrunk[i] == baggageFromTrunk{
                    self.myBaggageInTrunk.remove(at: i)
                    print("We've just get a \(baggageFromTrunk)")
                    break
                }
            }
        }else{
            print("There is nothing in the trunk")
        }
    }
}


struct TrunkCar{
    let model: String
    let age: Int
    let color: String
    let wheels : Int
    let windows : Int
    let doors : Int
    let speedMax : Int
    var speedDifference : Int
    let trunkVolumeMax : Double
    private var freeTrunkVolume : Double {
        didSet{
            print("-------------------")
            print("New freeTrunkVolum = \(freeTrunkVolume)")
            return
        }
    }
    var myBaggageInTrunk : [baggage]{
        didSet{
            print("-------------------")
            print("Update staff in the trunk = \(myBaggageInTrunk)")
            return
        }
    }
    var windowsState : state
    var autoEngine : engineState
    private var speed : Int {
        willSet{
            return speedDifference = Int(sqrt(pow(Double(newValue - speed),2)))
        }
        didSet{
            print("-------------------")
            print("Old value = \(oldValue)")
            print("New value = \(speed)")
            return print(" 'Speed difference' was changed = \(speedDifference)")
        }
    }
    //doors could be opened and closed. It depends on the autoEngine value
    var doorsState : state
    {
        get {
            if autoEngine == .started {
                print("Doors are blocked, becouse engine is \(autoEngine)")
                return .opened
            }else{
                print("Doors are unblocked, becouse engine is \(autoEngine)")
                return .closed
            }
        }
    }
    
    init(model: String, age: Int, color: String,speedMax: Int, trunkVolumeMax: Double, windowsState: state) {
        self.model = model
        self.age = age
        self.color = color
        self.wheels = 6
        self.windows = 2
        self.doors = 2
        self.myBaggageInTrunk = []
        self.speedMax = speedMax
        self.trunkVolumeMax = trunkVolumeMax
        self.windowsState = windowsState
        self.autoEngine = .stoped
        self.speed = 0
        self.speedDifference = 0
        self.freeTrunkVolume = trunkVolumeMax
    }
    
    mutating func carSpeedTrunk(_ newSpeed: Int){
        self.speed = newSpeed
        if self.speed > 0 {
            self.autoEngine = .started
            print("The car is going, the speed is = \(self.speed)")
        }else{
            self.autoEngine = .stoped
            print("The car has stoped, the speed is = \(self.speed)")
        }
    }
    
    mutating func putInTrunkTrunk(yourBaggage newBaggage: baggage, amount: Int){
        var i = 0
        while i < amount {
            if self.freeTrunkVolume - newBaggage.rawValue > 0{
                self.myBaggageInTrunk.append(newBaggage)
                self.freeTrunkVolume -= newBaggage.rawValue
                print("Cool. We put \(newBaggage) in car's trunk")
                i += 1
            }else{
                print("There is no place. Your \(newBaggage) = \(newBaggage.rawValue) but free volume is \(self.freeTrunkVolume)")
            }
        
        }
    }
    //дать возможность вносить массив данных (вещей)
    mutating func getFromTrunkTrunk(_ baggageFromTrunk: baggage){
        if self.myBaggageInTrunk.count > 0 {
            for i in (0..<self.myBaggageInTrunk.count){
                if self.myBaggageInTrunk[i] == baggageFromTrunk{
                    self.myBaggageInTrunk.remove(at: i)
                    print("We've just get a \(baggageFromTrunk)")
                    break
                }
            }
        }else{
            print("There is nothing in the trunk")
        }
    }
}
var myNewCar = SportCar(model: "Ford", age: 1992, color: "blue", speedMax: 180, trunkVolumeMax: 50, windowsState: .closed)
var myTunkCar = TrunkCar(model: "Jeep", age: 2000, color: "white", speedMax: 150, trunkVolumeMax: 300, windowsState: .opened)

//myNewCar.carSpeed(61)
myNewCar.putInTrunk(yourBaggage: .bag, amount: 2)
print("-------------------")
myNewCar.getFromTrunk(.bag)
print("-------------------")
myNewCar.getFromTrunk(.bag)
print("-------------------")
myNewCar.getFromTrunk(.bag)
myNewCar.putInTrunk(yourBaggage: .bag, amount: 2)

print("Trunk")
myTunkCar.getFromTrunkTrunk(.suitcase)
myTunkCar.putInTrunkTrunk(yourBaggage: .furniture, amount: 1)
print("-------------------")
