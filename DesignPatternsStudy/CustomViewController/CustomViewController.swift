//
//  CustomViewController.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 23/01/25.
//

import Foundation
import UIKit

class CustomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
    }
    
    func BuilderExample() {
        let director = FormDirector()
        let formBuilder = ConcreteFormBuilder()

        
        director.setBuilder(formBuilder)
        
        // Build a Registration Form
        director.constructRegistrationForm()
        
        let registrationForm = formBuilder.getResult()
        registrationForm.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(registrationForm)
        
        NSLayoutConstraint.activate([
            registrationForm.topAnchor.constraint(equalTo: view.topAnchor),
            registrationForm.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registrationForm.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registrationForm.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
