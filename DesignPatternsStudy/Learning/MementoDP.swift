//
//  MementoDP.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 20/01/25.
//

import Foundation

// O M C
// Originator - memento - caretaker
/*
 Memento = Data
 Originator = Action
 Caretaker = Memento container
 
 */

class MementoDP {
    let originator = Originator()
    let caretaker = Caretaker()
    
    init() {
        originator.write(text: "Primo write ")
        caretaker.push(originator.save())
        caretaker.getAllMementos().forEach { m in
            print(m.cotnent)
        }
        
        
        originator.write(text: "Secondo write ")
        caretaker.push(originator.save())
        caretaker.getAllMementos().forEach { m in
            print(m.cotnent)
        }
        
        originator.write(text: "Primo write ")
        caretaker.push(originator.save())
        caretaker.getAllMementos().forEach { m in
            print(m.cotnent)
        }
        
        originator.write(text: "Secondo write ")
        caretaker.push(originator.save())
        caretaker.getAllMementos().forEach { m in
            print(m.cotnent)
        }
        
        print(caretaker.pop())
        print(caretaker.pop())
        print(caretaker.pop())
        
    }
    
}

struct Memento {
    let cotnent: String
}

class Originator {
    private var content: String = ""
    
    func write(text: String) {
        content += text
    }
    
    func getContent() -> String { return content }
    
    func save() -> Memento { return Memento(cotnent: content) }
    
    func restore(from memento: Memento) { content = memento.cotnent }
}

class Caretaker {
    private var mementos: [Memento] = []
    
    func push(_ memento: Memento) {
        mementos.append(memento)
    }
    
    func pop() -> Memento? {
        return mementos.popLast()
    }
    
    func getAllMementos() -> [Memento] {
        return mementos
    }
}


