import UIKit

struct CalculationItem {
    let title: String
    let viewController: () -> UIViewController
}

final class CalculationsProvider {
    let calculations: [CalculationItem] = [
        CalculationItem(title: "⚗️ Дробная перегонка") { FractionalDistillationViewController() },
        CalculationItem(title: "💧 Разбавление спирта") { DilutionViewController() },
        CalculationItem(title: "🍶 Смесь спиртов") { MixtureViewController() },
        CalculationItem(title: "🌡️ Коррекция спиртометра") { AlcoholMeterCorrectionViewController() },
        CalculationItem(title: "⚖️ Перевод массы в объем") { MassToVolumeViewController() },
        CalculationItem(title: "📉 Изменение плотности") { DensityChangeViewController() },
        CalculationItem(title: "❄️ Охлаждение жидкости") { CoolingViewController() },
        CalculationItem(title: "🔌 Расчет мощности ТЭНа") { PowerCalculationViewController() },
        CalculationItem(title: "⏱️ Время нагрева") { HeatingTimeViewController() },
        CalculationItem(title: "🔥 Мощность нагрева") { HeatingPowerViewController() },
        CalculationItem(title: "🌾 Расчет затора") { MashCalculationViewController() },
        CalculationItem(title: "🚰 Заторная вода") { MashWaterViewController() }
    ]
}
