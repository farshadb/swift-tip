import UIKit
import Foundation
//PlayGround inheretance
class Player {
    //Properties
    var name : String
    var score : Int
    //methods
    func description() -> String {
        return("Player \(name) has a score of \(score)")
    }
    // init
    init() {
        self.name = "Jhon Doe"
        self.score = 0
    }
    //init with parameter
    init(name : String) {
        self.name = name
        self.score = 500
    }
}

class PremierPleyer : Player {
    //add properties
    var memberLvel : String
    override init(){
        memberLvel = "Gold"
        super.init()
    }
    override init(name : String){
         memberLvel = "Gold"
         super.init()
     }
     
    
    override func description() -> String {
        let origianMessage = super.description()
        return("\(origianMessage) and is a \(memberLvel) member.")
    }
    func calculateBonus(){
        self.score += 1000
        print("new score is \(self.score)")
    }
}

var newPlayer = PremierPleyer(name: "Farshad")
newPlayer.description()
var jake = Player()
print(jake.description())

class Person {
    //propertis
    var firstName : String
    var lastName : String
    
    //COMPUTED property
    var fullName : String {
       // get {
            // return computed  property (readonly)
            return firstName + " " + lastName
        //}
//        set {
//            // split newvalue into two peices
//            var newArray = newValue .components(separatedBy: " ")
//            firstName = newArray[0]
//            lastName = newArray[1]
//
//        }
    }
    
    init(first : String, last : String) {
        self.firstName = first
        self.lastName  = last
    }
}
var exampelPerson = Person(first: "Farshad", last: "Bolouri")
print(exampelPerson.fullName)
// exampelPerson.fullName = "Neda Nemati"

class BankAccount {
    // sorted properties
    let accountNumber  : Int
    let routingCode    = 123456789
    var balance        : Double
    
    //type property
    class var interestRate   : Float {
        return 2.0
         
    }
    
    init(num : Int, initialBalance : Double) {
        self.accountNumber = num
        self.balance       = initialBalance
    }
    func deposit(amount : Double) {
        balance += amount
    }
    func withDraw(amount : Double) -> Bool {
        if balance   > amount {
            balance -= amount
            return true
        } else {
            print("Insufficient funds")
            return false
        }
    }
    class func example() {
        // type methode CANNOT access instance data
        print("InterestedRate is \(self.interestRate)")
        
    }
}

var firstAccount = BankAccount(num: 1211122233, initialBalance: 10000.0)
var secondAccount = BankAccount(num: 1211122332, initialBalance: 100.0)




// lazy properties
func getDailyBonus() -> Int {
    print("Performing complicated task ... ")
    return Int.random(in: 100...20000)
}

class Player2 {
    //properties
    var name  : String = "Jhon Doe" {
        willSet {
            print("About to change \(name) to \(newValue)")
        }
        didSet {
            print("\(oldValue) has been changed to \(name)")
        }
    }
    var score = 0
    lazy var bonus = getDailyBonus()
    
    //method
    func description() -> String {
        return("Player \(name) has a score of \(score)")
    }
}

var readyPlayerOne =  Player2()
readyPlayerOne.name = "Farshad"
readyPlayerOne.name = "Hamed"
readyPlayerOne.bonus = 12312
//print(readyPlayerOne.bonus)

