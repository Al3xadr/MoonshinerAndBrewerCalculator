import UIKit
// FractionalDistillationViewController

class FractionalDistillationViewController: UIViewController {
    
    // MARK: - Properties
    private var rawSpiritVolume: Double = 0.0
    private var rawSpiritStrength: Double = 0.0
    private var temperature: Double = 0.0
    private var headsPercentage: Double = 9.0
    private var tailsPercentage: Double = 20.0
    private var finalStrength: Double = 92.0
    private var headsSpeed: Double = 200.0 // мл/час
    private var bodySpeed: Double = 2000.0 // мл/час
    
    // MARK: - UI Elements
    private let rawSpiritContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let rawSpiritTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Спирт-сырец"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let rawSpiritValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0 мл – 0.0% об."
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let editRawSpiritButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        return button
    }()
    
    private let totalContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let totalTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Итого"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let totalValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0 мл – 0.0% об."
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "при температуре 0.0 °C"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let headsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let headsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Головы"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let headsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "9%"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let tailsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let tailsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Хвосты"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let tailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20%"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let finalStrengthContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let finalStrengthTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Крепость продукта на выходе"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let finalStrengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "92% об."
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let outputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let outputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выход"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let headsOutputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Головная фракция"
        label.font = .systemFont(ofSize: 18, weight: .bold) // Увеличенный шрифт
        label.textColor = .systemRed
        return label
    }()
    
    private let headsVolumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0 мл"
        label.font = .systemFont(ofSize: 18, weight: .bold) // Увеличенный шрифт
        label.textColor = .systemRed
        return label
    }()
    
    private let headsRateTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "отбор при"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let headsSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "200 мл/час"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemBlue // Синий цвет для интерактивности
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let headsTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "– 0 часов 0 минут"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        
        return label
    }()
    
    private let bodyOutputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Тело продукта"
        label.font = .systemFont(ofSize: 18, weight: .bold) // Увеличенный шрифт
        label.textColor = .systemGreen
        return label
    }()
    
    private let bodyVolumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0 мл"
        label.font = .systemFont(ofSize: 18, weight: .bold) // Увеличенный шрифт
        label.textColor = .systemGreen
        return label
    }()
    
    private let bodyRateTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "отбор при"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let bodySpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 000 мл/час"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemBlue // Синий цвет для интерактивности
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let bodyTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "– 0 часов 0 минут"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let tailsOutputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Хвосты: 0 мл"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let absoluteAlcoholLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Абсолютный спирт: 0 мл"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let speedSettingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .systemGray6
        
        let mainStackView = UIStackView(arrangedSubviews: [
            createRawSpiritSection(),
            createTotalSection(),
            createHeadsTailsSection(),
            createFinalStrengthSection(),
            createOutputSection()
        ])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStackView)
        
        // Уменьшаем верхний отступ для "Спирт-сырец"
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), // Было 20, стало 10
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func createRawSpiritSection() -> UIView {
        rawSpiritContainerView.addSubview(rawSpiritTitleLabel)
        rawSpiritContainerView.addSubview(rawSpiritValueLabel)
        rawSpiritContainerView.addSubview(editRawSpiritButton)
        
        NSLayoutConstraint.activate([
            rawSpiritTitleLabel.topAnchor.constraint(equalTo: rawSpiritContainerView.topAnchor, constant: 10),
            rawSpiritTitleLabel.leadingAnchor.constraint(equalTo: rawSpiritContainerView.leadingAnchor, constant: 10),
            
            rawSpiritValueLabel.topAnchor.constraint(equalTo: rawSpiritTitleLabel.bottomAnchor, constant: 5),
            rawSpiritValueLabel.leadingAnchor.constraint(equalTo: rawSpiritContainerView.leadingAnchor, constant: 10),
            rawSpiritValueLabel.bottomAnchor.constraint(equalTo: rawSpiritContainerView.bottomAnchor, constant: -10),
            
            editRawSpiritButton.centerYAnchor.constraint(equalTo: rawSpiritContainerView.centerYAnchor),
            editRawSpiritButton.trailingAnchor.constraint(equalTo: rawSpiritContainerView.trailingAnchor, constant: -10)
        ])
        
        return rawSpiritContainerView
    }
    
    private func createTotalSection() -> UIView {
        totalContainerView.addSubview(totalTitleLabel)
        totalContainerView.addSubview(totalValueLabel)
        totalContainerView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            totalTitleLabel.topAnchor.constraint(equalTo: totalContainerView.topAnchor, constant: 10),
            totalTitleLabel.leadingAnchor.constraint(equalTo: totalContainerView.leadingAnchor),
            totalTitleLabel.trailingAnchor.constraint(equalTo: totalContainerView.trailingAnchor),
            
            totalValueLabel.topAnchor.constraint(equalTo: totalTitleLabel.bottomAnchor, constant: 5),
            totalValueLabel.leadingAnchor.constraint(equalTo: totalContainerView.leadingAnchor),
            totalValueLabel.trailingAnchor.constraint(equalTo: totalContainerView.trailingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: totalValueLabel.bottomAnchor, constant: 5),
            temperatureLabel.centerXAnchor.constraint(equalTo: totalValueLabel.centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: totalContainerView.bottomAnchor, constant: -10)
        ])
        
        return totalContainerView
    }
    
    private func createHeadsTailsSection() -> UIView {
        let stackView = UIStackView(arrangedSubviews: [headsContainerView, tailsContainerView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        headsContainerView.addSubview(headsTitleLabel)
        headsContainerView.addSubview(headsLabel)
        
        tailsContainerView.addSubview(tailsTitleLabel)
        tailsContainerView.addSubview(tailsLabel)
        
        NSLayoutConstraint.activate([
            headsTitleLabel.topAnchor.constraint(equalTo: headsContainerView.topAnchor, constant: 10),
            headsTitleLabel.leadingAnchor.constraint(equalTo: headsContainerView.leadingAnchor, constant: 10),
            
            headsLabel.topAnchor.constraint(equalTo: headsTitleLabel.bottomAnchor, constant: 5),
            headsLabel.leadingAnchor.constraint(equalTo: headsContainerView.leadingAnchor, constant: 10),
            headsLabel.bottomAnchor.constraint(equalTo: headsContainerView.bottomAnchor, constant: -10),
            
            tailsTitleLabel.topAnchor.constraint(equalTo: tailsContainerView.topAnchor, constant: 10),
            tailsTitleLabel.leadingAnchor.constraint(equalTo: tailsContainerView.leadingAnchor, constant: 10),
            
            tailsLabel.topAnchor.constraint(equalTo: tailsTitleLabel.bottomAnchor, constant: 5),
            tailsLabel.leadingAnchor.constraint(equalTo: tailsContainerView.leadingAnchor, constant: 10),
            tailsLabel.bottomAnchor.constraint(equalTo: tailsContainerView.bottomAnchor, constant: -10)
        ])
        
        return stackView
    }
    
    private func createFinalStrengthSection() -> UIView {
        finalStrengthContainerView.addSubview(finalStrengthTitleLabel)
        finalStrengthContainerView.addSubview(finalStrengthLabel)
        
        NSLayoutConstraint.activate([
            finalStrengthTitleLabel.topAnchor.constraint(equalTo: finalStrengthContainerView.topAnchor, constant: 10),
            finalStrengthTitleLabel.leadingAnchor.constraint(equalTo: finalStrengthContainerView.leadingAnchor, constant: 10),
            
            finalStrengthLabel.topAnchor.constraint(equalTo: finalStrengthTitleLabel.bottomAnchor, constant: 5),
            finalStrengthLabel.leadingAnchor.constraint(equalTo: finalStrengthContainerView.leadingAnchor, constant: 10),
            finalStrengthLabel.bottomAnchor.constraint(equalTo: finalStrengthContainerView.bottomAnchor, constant: -10)
        ])
        
        return finalStrengthContainerView
    }
    
    private func createOutputSection() -> UIView {
        let headsStack = UIStackView(arrangedSubviews: [headsOutputLabel, headsVolumeLabel])
        headsStack.axis = .horizontal
        headsStack.spacing = 10
        
        let headsRateTimeStack = UIStackView(arrangedSubviews: [headsRateTimeLabel, headsSpeedLabel, headsTimeLabel])
        headsRateTimeStack.axis = .horizontal
        headsRateTimeStack.spacing = 5
        
        let bodyStack = UIStackView(arrangedSubviews: [bodyOutputLabel, bodyVolumeLabel])
        bodyStack.axis = .horizontal
        bodyStack.spacing = 10
        
        let bodyRateTimeStack = UIStackView(arrangedSubviews: [bodyRateTimeLabel, bodySpeedLabel, bodyTimeLabel])
        bodyRateTimeStack.axis = .horizontal
        bodyRateTimeStack.spacing = 5
        
        let stackView = UIStackView(arrangedSubviews: [
            outputLabel,
            headsStack,
            headsRateTimeStack,
            bodyStack,
            bodyRateTimeStack,
            tailsOutputLabel,
            absoluteAlcoholLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 5
        
        outputContainerView.addSubview(stackView)
        outputContainerView.addSubview(speedSettingsButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        speedSettingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: outputContainerView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: outputContainerView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: outputContainerView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: outputContainerView.bottomAnchor, constant: -10),
            
            speedSettingsButton.trailingAnchor.constraint(equalTo: outputContainerView.trailingAnchor, constant: -10),
            speedSettingsButton.topAnchor.constraint(equalTo: outputContainerView.topAnchor, constant: 10)
        ])
        
        return outputContainerView
    }
    
    // MARK: - Setup Actions
    private func setupActions() {
        editRawSpiritButton.addTarget(self, action: #selector(editRawSpiritTapped), for: .touchUpInside)
        rawSpiritValueLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editRawSpiritTapped)))
        headsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editHeadsTapped)))
        tailsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editTailsTapped)))
        finalStrengthLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editFinalStrengthTapped)))
        headsSpeedLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editHeadsSpeedTapped)))
        bodySpeedLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editBodySpeedTapped)))
        speedSettingsButton.addTarget(self, action: #selector(editSpeedTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func editRawSpiritTapped() {
        let modalVC = RawSpiritInputModalViewController()
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: false)
    }
    
    @objc private func editHeadsTapped() {
        let modalVC = PercentageInputModalViewController(title: "Головы", currentValue: headsPercentage)
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    @objc private func editTailsTapped() {
        let modalVC = PercentageInputModalViewController(title: "Хвосты", currentValue: tailsPercentage)
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    @objc private func editFinalStrengthTapped() {
        let modalVC = PercentageInputModalViewController(title: "Крепость продукта", currentValue: finalStrength)
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    @objc private func editHeadsSpeedTapped() {
        let modalVC = SpeedInputModalViewController(headsSpeed: headsSpeed, bodySpeed: nil)
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    @objc private func editBodySpeedTapped() {
        let modalVC = SpeedInputModalViewController(headsSpeed: nil, bodySpeed: bodySpeed)
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    @objc private func editSpeedTapped() {
        let modalVC = SpeedInputModalViewController(headsSpeed: headsSpeed, bodySpeed: bodySpeed)
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    // MARK: - Update UI
    private func updateUI() {
        rawSpiritValueLabel.text = "\(String(format: "%.1f", rawSpiritVolume)) мл – \(String(format: "%.2f", rawSpiritStrength))% об."
        totalValueLabel.text = "\(String(format: "%.1f", rawSpiritVolume)) мл – \(String(format: "%.2f", rawSpiritStrength))% об."
        temperatureLabel.text = "при температуре \(String(format: "%.1f", temperature)) °C"
        headsLabel.text = "\(String(format: "%.1f", headsPercentage))%"
        tailsLabel.text = "\(String(format: "%.1f", tailsPercentage))%"
        finalStrengthLabel.text = "\(String(format: "%.1f", finalStrength))% об."
        
        let absoluteAlcoholInRaw = rawSpiritVolume * (rawSpiritStrength / 100)
        let headsVolume = (absoluteAlcoholInRaw * (headsPercentage / 100)) / 0.80
        let tailsVolume = rawSpiritVolume * (tailsPercentage / 100)
        let absoluteAlcoholInHeads = headsVolume * 0.80
        let absoluteAlcoholInTails = tailsVolume * 0.30
        let absoluteAlcoholInBody = absoluteAlcoholInRaw - absoluteAlcoholInHeads - absoluteAlcoholInTails
        let bodyVolume = absoluteAlcoholInBody / (finalStrength / 100)
        
        let headsTime = headsVolume / headsSpeed
        let headsHours = Int(headsTime)
        let headsMinutes = Int((headsTime - Double(headsHours)) * 60)
        
        let bodyTime = bodyVolume / bodySpeed
        let bodyHours = Int(bodyTime)
        let bodyMinutes = Int((bodyTime - Double(bodyHours)) * 60)
        
        headsVolumeLabel.text = "\(String(format: "%.0f", headsVolume)) мл"
        headsSpeedLabel.text = "\(String(format: "%.0f", headsSpeed)) мл/час"
        headsTimeLabel.text = "– \(headsHours) часов \(headsMinutes) минут"
        
        bodyVolumeLabel.text = "\(String(format: "%.0f", bodyVolume)) мл"
        bodySpeedLabel.text = "\(String(format: "%.0f", bodySpeed)) мл/час"
        bodyTimeLabel.text = "– \(bodyHours) часов \(bodyMinutes) минут"
        
        tailsOutputLabel.text = "Хвосты: \(String(format: "%.0f", tailsVolume)) мл"
        absoluteAlcoholLabel.text = "Абсолютный спирт: \(String(format: "%.0f", absoluteAlcoholInRaw)) мл"
    }
}


extension FractionalDistillationViewController: RawSpiritInputDelegate, PercentageInputDelegate, SpeedInputDelegate {
    func didSaveRawSpirit(volume: Double, strength: Double, temperature: Double) {
        self.rawSpiritVolume = volume
        self.rawSpiritStrength = strength
        self.temperature = temperature
        updateUI()
    }
    
    func didSavePercentage(_ percentage: Double, forKey: String) {
        switch forKey {
        case "Головы":
            headsPercentage = percentage
        case "Хвосты":
            tailsPercentage = percentage
        case "Крепость продукта":
            finalStrength = percentage
        default:
            break
        }
        updateUI()
    }
    
    func didSaveSpeeds(headsSpeed: Double?, bodySpeed: Double?) {
        if let headsSpeed = headsSpeed {
            self.headsSpeed = headsSpeed
        }
        if let bodySpeed = bodySpeed {
            self.bodySpeed = bodySpeed
        }
        updateUI()
    }
}
