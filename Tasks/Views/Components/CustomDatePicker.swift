//
//  CustomDatePicker.swift
//  Tasks
//
//  Created by Moose on 10/20/23.
//

import SwiftUI
import UIKit

struct CustomDatePicker: UIViewRepresentable {
    @Binding var selectedDate: Date

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.setValue(UIColor.blue, forKeyPath: "textColor")
        // ... Other customization ...
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged(_:)), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        uiView.date = selectedDate
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: CustomDatePicker

        init(_ parent: CustomDatePicker) {
            self.parent = parent
        }

        @objc func dateChanged(_ picker: UIDatePicker) {
            parent.selectedDate = picker.date
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    @State static private var selectedDate = Date()

    static var previews: some View {
        VStack {
            Spacer()
            CustomDatePicker(selectedDate: $selectedDate)
        }
        
    }
}
