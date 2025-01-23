//
//  AbstractDPV2.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 23/01/25.
//

import UIKit

/*
 Client <- CF(AF) <- CP(AP)
 */

//APCP

protocol ButtonStyle {
    func config(button: UIButton)
}

class LightButtonStyle: ButtonStyle {
    func config(button: UIButton) {
        button.backgroundColor = .white
        button.setTitle("Light", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
    }
}

class DarkButtonStyle: ButtonStyle {
    func config(button: UIButton) {
        button.backgroundColor = .black
        button.setTitle("Dark", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
    }
}

//Af Cf

protocol ButtonThemeFactory {
    func createButtonStyle() -> ButtonStyle
}

class LightThemeFactory: ButtonThemeFactory {
    func createButtonStyle() -> ButtonStyle {
        return LightButtonStyle()
    }
}

class DarkThemeFactory: ButtonThemeFactory {
    func createButtonStyle() -> ButtonStyle {
        return DarkButtonStyle()
    }
}
