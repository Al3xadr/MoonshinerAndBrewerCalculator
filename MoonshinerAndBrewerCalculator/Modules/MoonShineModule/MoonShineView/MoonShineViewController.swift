
import UIKit

final class MoonShineViewController: UIViewController {
    weak var coordinator: MoonShineCoordinator? 
    private let calculationsProvider: CalculationsProvider
    private var calculations: [CalculationItem] {
        return calculationsProvider.calculations
    }

    init(calculationsProvider: CalculationsProvider) {
        self.calculationsProvider = calculationsProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let calculations = [
//        "🥃 Дробная перегонка",
//        "💧 Разбавление спирта",
//        "🍶 Смесь спиртов",
//        "📏 Коррекция спиртометра",
//        "⚖️ Перевод массы в объем",
//        "📉 Изменение плотности",
//        "❄️ Охлаждение жидкости",
//        "🔌 Расчет мощности ТЭНа",
//        "⏱️ Время нагрева",
//        "🔥 Мощность нагрева",
//        "🌾 Расчет затора",
//        "🚰 Заторная вода",
//
//    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }


}

extension MoonShineViewController {
    
    private func setupViews() {
         view.backgroundColor = .systemGray6
         title = "Калькулятор"
         navigationController?.navigationBar.prefersLargeTitles = true
         
         tableView.dataSource = self
         tableView.delegate = self
         tableView.register(CalculationCell.self, forCellReuseIdentifier: CalculationCell.identifier)
         view.addSubview(tableView)
     }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MoonShineViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CalculationCell.identifier, for: indexPath) as! CalculationCell
        let calculation = calculations[indexPath.row]
        cell.configure(with: calculation.title)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCalculation = calculations[indexPath.row]
        let vc = selectedCalculation.viewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
