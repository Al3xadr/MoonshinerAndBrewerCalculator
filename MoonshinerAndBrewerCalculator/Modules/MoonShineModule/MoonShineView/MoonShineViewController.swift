
import UIKit

final class MoonShineViewController: UIViewController {
    let calculations = [
        "Дробная перегонка",
        "Скорость отбора",
        "Разбавление спирта",
        "Концентрирование спирта",
        "Смесь спиртов",
        "Перевод массы в объем",
        "Изменение плотности",
        "Температура смеси жидкостей",
        "Охлаждение жидкости",
        "Расчет мощности тена",
        "Время нагрева",
        "Мощность нагрева",
        "Коррекция спиртометра",
        "Расчет затора",
        "Заторная вода",

    ]
    
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
        let icon = UIImage(systemName: "gearshape.fill")
        cell.configure(with: calculations[indexPath.row], icon: icon)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = FractionalDistillationViewController() // Дробная перегонка
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = SelectionSpeedViewController() // Скорость отбора
            navigationController?.pushViewController(vc, animated: true)
           
        case 2:
            let vc = DilutionViewController() // Разбавление спирта
            navigationController?.pushViewController(vc, animated: true)
   
        case 3:
            let vc = MassToVolumeViewController() // Перевод массы в объем
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = DensityChangeViewController() // Изменение плотности
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = MixtureTemperatureViewController() // Температура смеси жидкостей
            navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = CoolingViewController() // Охлаждение жидкости
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = PowerCalculationViewController() // Расчет мощности тена
            navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = HeatingTimeViewController() // Время нагрева
            navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = HeatingPowerViewController() // Мощность нагрева
            navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = AlcoholMeterCorrectionViewController() // Коррекция спиртометра
            navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = MashCalculationViewController() // Расчет затора
            navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = MashWaterViewController() // Заторная вода
            navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = ConcentrationViewController() // Концентрирование спирта
            navigationController?.pushViewController(vc, animated: true)
        case 14:
            let vc = MixtureViewController() // Смесь спиртов
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    
}
