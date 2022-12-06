//
//  ViewController.swift
//  PassData
//
//  Created by Châu Hiệp on 01/12/2022.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Notification
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(_ :)), name: Notification.Name("text"), object: nil)
    }
    

    //MARK: NotificationCenter
    @objc func onNotification(_ notification: Notification){
        let text = notification.object as! String?
        label.text = text
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? SecondaryViewController
        {
            vc.txt = textField.text ?? ""
        }
    }
    
    
    @IBAction func didTapButton(){
        let vc = storyboard?.instantiateViewController(identifier: "Secondary") as! SecondaryViewController
        vc.modalPresentationStyle = .fullScreen
        vc.txt = textField.text ?? ""
        //MARK: Closure
//        vc.completionHandler = { text in
//            self.label.text = text
//        }
        //MARK: Delegation
//        vc.delegate = self

        present(vc , animated: true)
    }


}
//MARK: Delegation
//extension ViewController : TextDelegate{
//    func passText(_ input:String?){
//        label.text = input
//    }
//}
