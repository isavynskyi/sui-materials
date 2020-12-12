//
//  SliderView.swift
//  BullsEye
//
//  Created by Ihor Savynskyi on 12.12.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    class Coordinator: NSObject {
        var parent: SliderView
        init(_ parent: SliderView) {
            self.parent = parent
        }
        
        @objc func updateSlider(_ sender: UISlider) {
            parent.value = sender.value * 100
        }
    }
    
    typealias UIViewType = UISlider
    @Binding var value: Float
    @Binding var alpha: Float

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.backgroundColor = .blue
        slider.minimumValue = 0.0
        slider.value = Float(value/100.0)
        slider.maximumValue = 1.0
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.updateSlider(_:)),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.alpha = CGFloat(self.alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(0.2), alpha: .constant(0.2))
    }
}
