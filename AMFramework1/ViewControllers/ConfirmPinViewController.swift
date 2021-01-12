//
//  ConfirmPinViewController.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 12/01/21.
//

import UIKit

class ConfirmPinViewController: UIViewController {

    // MARK: Public stuff
    public var completionHandler: ((String, Framwork1Error?)->Void)?
    
    public static func instantiateConfirmPinViewController() -> ConfirmPinViewController? {
        let bundle = Bundle(for: EnterPinViewController.self)
        let story = UIStoryboard(name: "AMFramework1Storyboard", bundle: bundle)
        if let vc = story.instantiateViewController(withIdentifier: "ConfirmPinViewControllerID") as? ConfirmPinViewController {
            return vc
        }
        return nil
    }
    
    @IBOutlet weak var tickButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Confirm"
        self.navigationItem.hidesBackButton = true
        textField.becomeFirstResponder()
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPayment))
        self.navigationItem.leftBarButtonItem = cancel
    }

    @IBAction func didTappedSubmitButton(_ sender: UIButton) {
        if tickButton.currentTitle == "Ticked", let handler = completionHandler {
            dismiss(animated: true) {
                handler("Submitted  successfully!", nil)
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
    
    @objc private func cancelPayment() {
        if let handler = completionHandler {
            dismiss(animated: true) {
                handler("Payment Caneled by user", .cancel)
            }
        }
    }
}
