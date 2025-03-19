import UIKit
import UIKit

class SpeedInputModalViewController: UIViewController {
    
    weak var delegate: SpeedInputDelegate?
    
    private let headsSpeed: Double?
    private let bodySpeed: Double?
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let headsSpeedLabel: UILabel? = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скорость отбора голов (мл/час):"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let headsSpeedTextField: UITextField? = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let bodySpeedLabel: UILabel? = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скорость отбора тела (мл/час):"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let bodySpeedTextField: UITextField? = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    init(headsSpeed: Double?, bodySpeed: Double?) {
        self.headsSpeed = headsSpeed
        self.bodySpeed = bodySpeed
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        var arrangedSubviews: [UIView] = []
        
        if headsSpeed != nil, let headsSpeedLabel = headsSpeedLabel, let headsSpeedTextField = headsSpeedTextField {
            headsSpeedTextField.text = "\(headsSpeed!)"
            arrangedSubviews.append(headsSpeedLabel)
            arrangedSubviews.append(headsSpeedTextField)
        }
        
        if bodySpeed != nil, let bodySpeedLabel = bodySpeedLabel, let bodySpeedTextField = bodySpeedTextField {
            bodySpeedTextField.text = "\(bodySpeed!)"
            arrangedSubviews.append(bodySpeedLabel)
            arrangedSubviews.append(bodySpeedTextField)
        }
        
        arrangedSubviews.append(saveButton)
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(stackView)
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),

            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupActions() {
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModal))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
    
    @objc private func saveTapped() {
        var newHeadsSpeed: Double?
        var newBodySpeed: Double?
        
        if headsSpeed != nil, let headsText = headsSpeedTextField?.text, let headsValue = Double(headsText) {
            newHeadsSpeed = headsValue
        }
        
        if bodySpeed != nil, let bodyText = bodySpeedTextField?.text, let bodyValue = Double(bodyText) {
            newBodySpeed = bodyValue
        }
        
        delegate?.didSaveSpeeds(headsSpeed: newHeadsSpeed, bodySpeed: newBodySpeed)
        dismiss(animated: true)
    }
}
