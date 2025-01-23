//
//  BuilderDP.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 23/01/25.
//

import UIKit

/*
 Abstract & concrete Builder
    - i possibili elementi di UI (eg. textfield bottoni o label) con i loro elementi di implementazione(tipo string)
 Director
 costruisce per intero le casistiche richieste, con gli elementi che si creano dentro al builder
 */

protocol FormBuilder {
    func reset()
    func addTextField(placeholder: String)
    func addButton(title: String)
    func addLabel(text: String)
    func getResult() -> UIView
}

class ConcreteFormBuilder: FormBuilder {
    private var formView: UIView = UIView()
    private var stackView: UIStackView = UIStackView()
    
    init() {
        configureStackView()
    }
    
    func reset() {
        formView = UIView() // Reset the view for a new form
        configureStackView()
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        formView.addSubview(stackView)
        
        // Add constraints to center the stackView in the formView
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: formView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: formView.bottomAnchor, constant: -16)
        ])
    }
    
    func addTextField(placeholder: String) {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textField)
    }
    
    func addButton(title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)
    }
    
    func addLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
    }
    
    func getResult() -> UIView {
        return formView
    }
}

class FormDirector {
    private var builder: FormBuilder?
    
    func setBuilder(_ builder: FormBuilder) {
        self.builder = builder
    }
    
    func constructLoginForm() {
        builder?.reset()
        builder?.addLabel(text: "Login Form")
        builder?.addTextField(placeholder: "Username")
        builder?.addTextField(placeholder: "Password")
        builder?.addButton(title: "Login")
    }
    
    func constructRegistrationForm() {
        builder?.reset()
        builder?.addLabel(text: "Registration Form")
        builder?.addTextField(placeholder: "Email")
        builder?.addTextField(placeholder: "Username")
        builder?.addTextField(placeholder: "Password")
        builder?.addButton(title: "Register")
    }
}
