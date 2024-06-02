//
//  PickerTextField.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 02/06/2024.
//

import SwiftUI

struct PickerTextField: UIViewRepresentable {
    
    private let textField = UITextField()
    private let pickerView = UIPickerView()
    private let helper = Helper()
    
    var data: [String]
    var placeHolder: String
    
    @Binding var lastSelectedIndex: Int?
    
    class Coordinator: NSObject, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
        
        private var data: [String]
        private var didSelectedItem: ((Int) -> ())?
        
        init(data: [String], didSelectedItem: ((Int) -> ())? = nil) {
            self.data = data
            self.didSelectedItem = didSelectedItem
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return data.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return data[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            didSelectedItem?(row)
        }
        
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if UIPasteboard.general.isKind(of: UIPasteboard.self){
                return false
            }
            return true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(data: data) { index in
            lastSelectedIndex = index
        }
    }
    
    func makeUIView(context: Context) -> UITextField {
        self.pickerView.delegate = context.coordinator
        self.pickerView.dataSource = context.coordinator
        
        self.textField.placeholder = placeHolder
        self.textField.inputView = self.pickerView
        
        self.textField.layer.borderColor = UIColor(named: "#E8E8E8")?.cgColor
        self.textField.borderStyle = .none
        self.textField.layer.borderWidth = 1
        self.textField.layer.cornerRadius = 20
        
        self.textField.delegate = context.coordinator
        
        self.textField.addPadding(amount: 20, PlaceHolder: "", Color: .gray)
        
        // Confrim Accessory view.
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flixbableSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self.helper, action: #selector(self.helper.doneButtonHandler))
        toolBar.setItems([flixbableSpace,doneButton], animated: true)
        
        textField.inputAccessoryView = toolBar
        self.helper.doneHandler = {
            if self.lastSelectedIndex == nil {
                self.lastSelectedIndex = 0
            }
            
            self.textField.resignFirstResponder()
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let lastSelectedIndex = lastSelectedIndex {
            uiView.text = data[lastSelectedIndex]
        }
    }
    
    
    class Helper {
        var doneHandler: (() -> Void)?
        
        @objc func doneButtonHandler() {
            doneHandler?()
        }
    }
}


struct PickerView: View {
    
    @Binding var selectedIndex: Int?
    @State var labelTitle: String
    @State var data: [String]
    @State var isnotImportant: Bool = true
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            HStack(spacing: 5) {
                Text(labelTitle)
                    .font(.system(size: 12))
                    .foregroundColor(Color("#A2A2A2"))
                
                Text("*")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .hidden(isnotImportant)
                
                Spacer()
                
            }
            
            PickerTextField(data: data,
                            placeHolder: "Select type",
                            lastSelectedIndex: $selectedIndex)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .overlay {
                HStack {
                    Spacer()
                    
                    Image("downIndecator")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26)
                        .padding([.bottom], 4)
                    
                    Text("")
                    Text("")
                    Text("")
                }
            }
            
        }
        .listRowInsets(EdgeInsets()) // Remove default padding
        .listRowSeparator(.hidden)
        .padding()
        .padding([.bottom,.top],-10)
        
    }
}

extension UITextField {
    
    private func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    private func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addPadding(amount:CGFloat, PlaceHolder:String , Color: UIColor) {
        setLeftPaddingPoints(amount)
        setRightPaddingPoints(amount)
        
        self.attributedPlaceholder = NSAttributedString(string: PlaceHolder,
                attributes: [NSAttributedString.Key.foregroundColor: Color])
    }
}


#Preview {
    @State var selected: Int? = 0
    return PickerView(selectedIndex: $selected,
                      labelTitle: "Company type",
                      data: ["Indevidual,Normal"])
}
