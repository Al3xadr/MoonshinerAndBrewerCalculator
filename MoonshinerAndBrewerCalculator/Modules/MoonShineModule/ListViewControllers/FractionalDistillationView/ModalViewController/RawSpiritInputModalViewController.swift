import UIKit
class RawSpiritInputModalViewController: UIViewController {
    
    weak var delegate: RawSpiritInputDelegate?
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let volumeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Объем (мл)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let strengthTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Крепость (% об.)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let temperatureTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Температура (°C)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        view.addSubview(containerView)
        containerView.addSubview(volumeTextField)
        containerView.addSubview(strengthTextField)
        containerView.addSubview(temperatureTextField)
        containerView.addSubview(closeButton)
        containerView.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            
            volumeTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            volumeTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            volumeTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            strengthTextField.topAnchor.constraint(equalTo: volumeTextField.bottomAnchor, constant: 10),
            strengthTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            strengthTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            temperatureTextField.topAnchor.constraint(equalTo: strengthTextField.bottomAnchor, constant: 10),
            temperatureTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            temperatureTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            saveButton.topAnchor.constraint(equalTo: temperatureTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupActions() {
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    @objc private func closeTapped() {
        dismiss(animated: false)
    }
    
    @objc private func saveTapped() {
        guard let volumeText = volumeTextField.text, let volume = Double(volumeText),
              let strengthText = strengthTextField.text, let strength = Double(strengthText),
              let temperatureText = temperatureTextField.text, let temperature = Double(temperatureText) else {
            return
        }
        delegate?.didSaveRawSpirit(volume: volume, strength: strength, temperature: temperature)
        dismiss(animated: false)
    }
}
