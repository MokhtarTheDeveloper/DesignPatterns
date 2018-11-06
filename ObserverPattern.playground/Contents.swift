import Foundation

protocol Subject {
    func addObserver(o: Observer, forKey: String)
    func removeObserver(o : Observer, forKey: String)
    func updateObservers()
}


protocol Observer {
    func updateData(value: Int?)
}


protocol Display {
    func displayValue()
}


class SubjectClass : Subject {
    
    
    var observers = [String: Observer]()
    var value : Int?
    
    func addObserver(o: Observer, forKey: String) {
        observers[forKey] = o
    }
    
    func removeObserver(o: Observer, forKey: String) {
        observers.removeValue(forKey: forKey)
    }
    
    func updateObservers() {
        for (_ , observer) in observers {
            observer.updateData(value: value)
        }
    }
    
    func setValue (value: Int) {
        self.value = value
        updateObservers()
    }
    
    
}

class FirstObserverClass : Observer, Display {
    var value : Int?
    var observerKey : String
    init(subject: Subject) {
        let key = NSUUID().uuidString
        self.observerKey = key
        subject.addObserver(o: self, forKey: key)
    }
    
    func updateData(value: Int?) {
        self.value = value
        displayValue()
    }
    
    func displayValue() {
        print("FirstObserver value changed to \(value!)")
    }
    
    
}

class SecondObserverClass : Observer, Display {
    var value : Int?
    var observerKey : String
    
    init(subject : Subject) {
        let key = NSUUID().uuidString
        self.observerKey = key
        subject.addObserver(o: self, forKey: key)
    }
    func updateData(value: Int?) {
        self.value = value
        displayValue()
    }
    
    func displayValue() {
        print("SecondObserver value changed to \(value!)")
    }
    
    
}

let subject = SubjectClass()
let firsObserver = FirstObserverClass(subject: subject)
let secondObserver = SecondObserverClass(subject: subject)
subject.setValue(value: 2)
subject.setValue(value: 3)
subject.setValue(value: 15)
subject.removeObserver(o: firsObserver, forKey: firsObserver.observerKey)
subject.removeObserver(o: secondObserver, forKey: secondObserver.observerKey)
