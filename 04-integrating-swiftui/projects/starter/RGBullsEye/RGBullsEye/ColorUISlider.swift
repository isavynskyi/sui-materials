//
//  ColorUISlider.swift
//  RGBullsEye
//
//  Created by Ihor Savynskyi on 11.12.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    class Coordinator: NSObject {
        var parent: ColorUISlider
        init(_ parent: ColorUISlider) {
            self.parent = parent
        }
        
        @objc func updateColorUISlider(_ sender: UISlider) {
            parent.value = Double(sender.value)
        }
    }
    
    var color: UIColor
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.minimumTrackTintColor = .yellow
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.updateColorUISlider(_:)),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(self.value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, value: .constant(0.25))
    }
}
