//
//  AbstractDP.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 20/01/25.
//

import Foundation

//ABSTRACT DP

// Product Protocol + concrete && Factory protocol + Concrete
/*
 4 Steps to memorize
 Define a product
 Build the product
 
 Define a blueprint for making Products -FACTORY protocol-
 Create Matching products in family - VictorianFurnitureFactory -
 
 Client Code
 Passare il protocollo in una funzione e recuperare il necessario
 
 FACT
 Family of products
    - chair & sofa
 Abstract
    - protocols of families
 
 Concrete Products & families
    - objects implement the protocols
        - Products with abstracts
        -
 */
//Product Protocol
protocol Chair {
    func hasLegs() -> Bool
    func sitOn()
}

protocol Sofa {
    func hasCushons() -> Bool
    func lieDown()
}

//Product concrete
class ModernChair: Chair {
    func hasLegs() -> Bool { return true }
    
    func sitOn() {
        print("Sitting")
    }
}

class ModernSofa: Sofa {
    func hasCushons() -> Bool { return true }
    
    func lieDown() {
        print("Lying down")
    }
}

class VictorianChair: Chair {
    func hasLegs() -> Bool { return true }
    
    func sitOn() {
        print("Victorian Sitting")
    }
}

class VictorianSofa: Sofa {
    func hasCushons() -> Bool { return true }
    
    func lieDown() {
        print("Victorian Lying down")
    }
}

// Factory

// Protocol
protocol FurnitureFactory {
    func makeChair() -> Chair
    func makeSofa() -> Sofa
}

//Concrete
class ModernFurnitureFactory: FurnitureFactory {
    func makeChair() -> any Chair {
        return ModernChair()
    }
    
    func makeSofa() -> any Sofa {
        return ModernSofa()
    }
}

class VictorianFurnitureFactory: FurnitureFactory {
    func makeChair() -> any Chair {
        return VictorianChair()
    }
    
    func makeSofa() -> any Sofa {
        return VictorianSofa()
    }
}

//CLIENT

class AbstractDPClient {
 
    func displayFurniture(factory: FurnitureFactory) {
        let chair = factory.makeChair()
        let sofa = factory.makeSofa()
        
        print("Chair has legs:", chair.hasLegs())
        chair.sitOn()
        
        print("Sofa has Cushions:", sofa.hasCushons())
        sofa.lieDown()
    }
}


//APCP AFCF

// families
//Abstract Products
protocol Button {
    func render() -> String
}

protocol TextField {
    func render() -> String
}

//Concrete Products
class LButton: Button {
    func render() -> String {
        return "LButton"
    }
}

class DButton: Button {
    func render() -> String {
        return "DButton"
    }
}

class LTextField: TextField {
    func render() -> String {
        return "LTextField"
    }
}

class DTextField: TextField {
    func render() -> String {
        return "DTextField"
    }
}

//Abstract Factory

protocol ThemeFactory {
    func createButton() -> Button
    func createTextField() -> TextField
}

//Concrete Factory

class LFactory: ThemeFactory {
    func createButton() -> Button { LButton() }
    
    func createTextField() -> TextField { LTextField() }
}

class DFactory: ThemeFactory {
    func createButton() -> Button { DButton() }
    
    func createTextField() -> TextField { DTextField() }
}

class AbstractClient {
    init() {
        setupUI(theme: DFactory())
    }
    
    func setupUI (theme: ThemeFactory) {
        let button = theme.createButton()
        let textfield = theme.createTextField()
        
        print(button.render())
        print(textfield.render())
        
    }
}
