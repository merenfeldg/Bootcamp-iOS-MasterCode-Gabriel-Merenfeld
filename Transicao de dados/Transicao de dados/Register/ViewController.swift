import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var primaryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPrimaryButton()
    }
    
    @IBAction func tappedChangeStatePrimaryButton(_ sender: Any) {
        
    }
    
    private func configPrimaryButton() {
        primaryButton.isEnabled = verifyIfAllFieldsAreFilled()
    }
    
    private func verifyIfAllFieldsAreFilled() -> Bool {
        return nameTextField.text?.isEmpty == false && surnameTextField.text?.isEmpty == false && emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
    }
}

