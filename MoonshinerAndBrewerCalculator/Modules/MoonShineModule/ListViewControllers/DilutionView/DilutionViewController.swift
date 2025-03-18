import UIKit

//MARK: - экран Разбавление спирта

final class DilutionViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Разбавление спирта"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let initialConcentrationField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Исходная концентрация (%)"
        field.borderStyle = .roundedRect
        field.keyboardType = .decimalPad
        return field
    }()
    
    private let volumeField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Объем (л)"
        field.borderStyle = .roundedRect
        field.keyboardType = .decimalPad
        return field
    }()
    
    private let desiredConcentrationField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Желаемая концентрация (%)"
        field.borderStyle = .roundedRect
        field.keyboardType = .decimalPad
        return field
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Рассчитать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Результат: "
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(initialConcentrationField)
        view.addSubview(volumeField)
        view.addSubview(desiredConcentrationField)
        view.addSubview(calculateButton)
        view.addSubview(resultLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            initialConcentrationField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            initialConcentrationField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            initialConcentrationField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            initialConcentrationField.heightAnchor.constraint(equalToConstant: 40),
            
            volumeField.topAnchor.constraint(equalTo: initialConcentrationField.bottomAnchor, constant: 15),
            volumeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            volumeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            volumeField.heightAnchor.constraint(equalToConstant: 40),
            
            desiredConcentrationField.topAnchor.constraint(equalTo: volumeField.bottomAnchor, constant: 15),
            desiredConcentrationField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            desiredConcentrationField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            desiredConcentrationField.heightAnchor.constraint(equalToConstant: 40),
            
            calculateButton.topAnchor.constraint(equalTo: desiredConcentrationField.bottomAnchor, constant: 30),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func calculate() {
        guard let initial = Double(initialConcentrationField.text ?? ""),
              let volume = Double(volumeField.text ?? ""),
              let desired = Double(desiredConcentrationField.text ?? ""),
              initial > desired else {
            resultLabel.text = "Ошибка ввода"
            return
        }
        
        let waterToAdd = (initial * volume - desired * volume) / desired
        resultLabel.text = "Нужно добавить \(String(format: "%.2f", waterToAdd)) л воды"
    }
}
