
import UIKit
//MARK: - SCREEN Смесь спиртов

final class MixtureViewController: UIViewController {
    
    // MARK: - Properties
     var spirits: [(volume: Double, strength: Double, temperature: Double)] = []
    private let contractionFactor: Double = 0.975 // Коэффициент контракции (2.5% уменьшение объема)
    
    // MARK: - UI Elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пропорции спирта"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let spiritsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let addSpiritButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
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
        label.text = "0 мл – 0% об."
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "при температуре 20 °C с учетом контракции"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        updateUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let mainStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            spiritsStackView,
            addSpiritButton,
            totalContainerView
        ])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(mainStackView)
        
        totalContainerView.addSubview(totalTitleLabel)
        totalContainerView.addSubview(totalValueLabel)
        totalContainerView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            addSpiritButton.heightAnchor.constraint(equalToConstant: 44),
            addSpiritButton.widthAnchor.constraint(equalToConstant: 44),
            addSpiritButton.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            
            totalTitleLabel.topAnchor.constraint(equalTo: totalContainerView.topAnchor, constant: 10),
            totalTitleLabel.leadingAnchor.constraint(equalTo: totalContainerView.leadingAnchor),
            totalTitleLabel.trailingAnchor.constraint(equalTo: totalContainerView.trailingAnchor),
            
            totalValueLabel.topAnchor.constraint(equalTo: totalTitleLabel.bottomAnchor, constant: 5),
            totalValueLabel.leadingAnchor.constraint(equalTo: totalContainerView.leadingAnchor),
            totalValueLabel.trailingAnchor.constraint(equalTo: totalContainerView.trailingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: totalValueLabel.bottomAnchor, constant: 5),
            temperatureLabel.centerXAnchor.constraint(equalTo: totalContainerView.centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: totalContainerView.bottomAnchor, constant: -10)
        ])
        
        addSpiritView()
        addSpiritView()
    }
    
    // MARK: - Setup Actions
    private func setupActions() {
        addSpiritButton.addTarget(self, action: #selector(addSpiritTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func addSpiritTapped() {
        addSpiritView()
    }
    
    @objc private func editSpiritTapped(_ sender: UITapGestureRecognizer) {
        guard let spiritView = sender.view?.superview as? SpiritInputView else { return }
        let index = spiritsStackView.arrangedSubviews.firstIndex(of: spiritView) ?? 0
        let spirit = spirits[index]
        let modalVC = SpiritInputModalViewController(volume: spirit.volume, strength: spirit.strength, temperature: spirit.temperature)
        modalVC.delegate = self
        modalVC.index = index
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    // MARK: - Helper Methods
    private func addSpiritView(volume: Double = 0.0, strength: Double = 0.0, temperature: Double = 20.0) {
        let spiritView = SpiritInputView()
        spiritView.translatesAutoresizingMaskIntoConstraints = false
        spiritView.valueLabel.text = "\(String(format: "%.0f", volume)) мл – \(String(format: "%.2f", strength))% об."
        spiritView.valueLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editSpiritTapped)))
        spiritsStackView.addArrangedSubview(spiritView)
        spirits.append((volume: volume, strength: strength, temperature: temperature))
        updateUI()
    }
    
     func updateUI() {
        // Обновляем значения в UI
        for (index, spirit) in spirits.enumerated() {
            if index < spiritsStackView.arrangedSubviews.count {
                let spiritView = spiritsStackView.arrangedSubviews[index] as! SpiritInputView
                spiritView.valueLabel.text = "\(String(format: "%.0f", spirit.volume)) мл – \(String(format: "%.2f", spirit.strength))% об."
            }
        }
        
        // Рассчитываем итоговую смесь
        let totalVolume = spirits.reduce(0.0) { $0 + $1.volume }
        let totalAbsoluteAlcohol = spirits.reduce(0.0) { $0 + ($1.volume * $1.strength / 100) }
        
        // Учитываем контракцию
        let finalVolume = totalVolume * contractionFactor
        let finalStrength = finalVolume > 0 ? (totalAbsoluteAlcohol / finalVolume) * 100 : 0.0
        
        // Рассчитываем среднюю температуру
        let averageTemperature = spirits.isEmpty ? 20.0 : spirits.reduce(0.0) { $0 + $1.temperature } / Double(spirits.count)
        
        totalValueLabel.text = "\(String(format: "%.0f", finalVolume)) мл – \(String(format: "%.2f", finalStrength))% об."
        temperatureLabel.text = "при температуре \(String(format: "%.0f", averageTemperature)) °C с учетом контракции"
    }
}
