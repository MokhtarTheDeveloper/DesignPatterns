import Foundation
protocol FlyBehavior : class{
    func fly()
}

class CanFly: FlyBehavior {
    func fly() {
        print("i can fly")
    }
}

class CantFly : FlyBehavior {
    func fly() {
        print("I can't fly")
    }
}

class Duck {
    var flyBehavior : FlyBehavior?
    func performFly() {
        flyBehavior?.fly()
    }
}

class redDuck: Duck {
    override init() {
        super.init()
        self.flyBehavior = CanFly()
    }
}

class RubberDuck : Duck {
    override init() {
        super.init()
        self.flyBehavior = CantFly()
    }
}

var r = RubberDuck()
var red = redDuck()
print(r.performFly(), red.performFly())

var str = "Hello, playground"
