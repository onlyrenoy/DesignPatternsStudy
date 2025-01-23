//
//  CustomView.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 23/01/25.
//

import Foundation
import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        
        
    }
    
    /*
     funzione di setup della factory:
        init della Concrete Factory (CF)
        chiamare il metodo della Concrete Product(CP) dalla CF
     */
    
    func setupButton(theme: ButtonThemeFactory, button: UIButton) {
        let bs = theme.createButtonStyle()
        bs.config(button: button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func factoryExample() {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let tm = LightThemeFactory()
        setupButton(theme: tm, button: button)
        
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    func builderExample() {
        let director = FormDirector()
        let formBuilder = ConcreteFormBuilder()

        
        director.setBuilder(formBuilder)
        
        // Build a Login Form
        director.constructLoginForm()
        let login = formBuilder.getResult()
        login.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(login)
        
        NSLayoutConstraint.activate([
            login.topAnchor.constraint(equalTo: topAnchor),
            login.leadingAnchor.constraint(equalTo: leadingAnchor),
            login.trailingAnchor.constraint(equalTo: trailingAnchor),
            login.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
