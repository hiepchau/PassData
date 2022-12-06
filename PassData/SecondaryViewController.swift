//
//  SecondaryViewController.swift
//  PassData
//
//  Created by Châu Hiệp on 01/12/2022.
//

import UIKit
protocol TextDelegate{
    func passText(_ input:String?)
}
class SecondaryViewController: UIViewController {
    
    var txt: String = ""
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    public var completionHandler: ((String?) ->Void)?
    var delegate: TextDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = txt
    }
    
    @IBAction func didTapSave(){
        //MARK: Closure
//        completionHandler?(field.text)
        
        //MARK: NotificationCenter
        NotificationCenter.default.post(name: Notification.Name("text"), object: field.text)
        
        //MARK: Delegate
//        self.delegate.passText(field.text ?? "")

        dismiss(animated: true, completion: nil)
    }
}
