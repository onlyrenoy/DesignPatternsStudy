//
//  CustomViewRepresentable.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 23/01/25.
//

import Foundation
import SwiftUI

struct CustomViewRepresentable: UIViewRepresentable {
    // Create the `UIView` instance
    func makeUIView(context: Context) -> CustomView {
        return CustomView()
    }
    
    // Update the `UIView` with SwiftUI changes
    func updateUIView(_ uiView: CustomView, context: Context) {
        // Update properties if needed
    }
}
