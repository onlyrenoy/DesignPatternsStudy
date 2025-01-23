//
//  CustomViewControllerRepresentable.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 23/01/25.
//

import Foundation
import SwiftUI

struct CustomViewControllerRepresentable: UIViewControllerRepresentable {
    // Create the `UIViewController` instance
    func makeUIViewController(context: Context) -> CustomViewController {
        return CustomViewController()
    }
    
    // Update the `UIViewController` with SwiftUI changes
    func updateUIViewController(_ uiViewController: CustomViewController, context: Context) {
        // Update properties if needed
    }
}
