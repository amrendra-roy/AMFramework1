//
//  EnterPinViewController.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 12/01/21.
//

import UIKit

public class EnterPinViewController: UIViewController {

    // MARK: Public Stuff
    public var completionHandler: ((String, Framwork1Error?)-> Void)?
    
    // MARK: Private stuff
    @IBOutlet private weak var paymetToValueLbl: UILabel!
    @IBOutlet private weak var tickButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    
    private static var payeeName = ""
    
    public static func instantiateEnterPinViewController(with payee: String) -> EnterPinViewController? {
        let bundle = Bundle(for: EnterPinViewController.self)
        let story = UIStoryboard(name: "AMFramework1Storyboard", bundle: bundle)
        if let vc = story.instantiateViewController(withIdentifier: "EnterPinViewControllerID") as? EnterPinViewController {
            payeeName = payee
            return vc
        }
        return nil
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Payment Screen"
        paymetToValueLbl.text = EnterPinViewController.payeeName //will use this by ViewModel
        textField.becomeFirstResponder()
    }
    
    @IBAction func didTappedConfirmButon(_ sender: UIButton) {
        if tickButton.currentTitle == "Ticked" {
            //move to next
            if let vc = ConfirmPinViewController.instantiateConfirmPinViewController() {
                vc.completionHandler = { (message, error) in
                    if let handler = self.completionHandler {
                        handler(message, error)
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }else {
            let alert = UIAlertController(title: "Alert!", message: "Please select ticked button", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func toggleTickUntick(_ sender: UIButton) {
        if tickButton.currentTitle == "UnTick" {
            tickButton.setTitle("Ticked", for: .normal)
        }else {
            tickButton.setTitle("UnTick", for: .normal)
        }
    }
    
    @IBAction func cancelPayment(_ sender: UIBarButtonItem) {
        if let handler = completionHandler {
            dismiss(animated: true) {
                handler("Canceled by user", .cancel)
            }
        }
    }

}
