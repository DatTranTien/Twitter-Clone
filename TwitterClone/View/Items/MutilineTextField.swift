//
//  MutilineTextField.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import Foundation
import SwiftUI

struct MutilineTextField: UIViewRepresentable {
   
    @Binding var text: String
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    func makeUIView(context: Context) -> UITextView {
        let text = UITextView()
        text.isEditable = true
        text.text = "Type Something"
        text.isUserInteractionEnabled = true
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    func makeCoordinator() -> MutilineTextField.Coordinator {
        return MutilineTextField.Coordinator(parent: self)
    }
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MutilineTextField
        
        init(parent: MutilineTextField) {
            self.parent = parent
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text=""
            textView.textColor = .black
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text=textView.text
        }
    }
}
