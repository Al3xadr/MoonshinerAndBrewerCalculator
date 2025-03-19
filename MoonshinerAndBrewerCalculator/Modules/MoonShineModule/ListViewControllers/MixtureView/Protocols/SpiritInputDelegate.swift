// MARK: - Delegate Protocols
import Foundation
protocol SpiritInputDelegate: AnyObject {
    func didSaveSpirit(volume: Double, strength: Double, temperature: Double, at index: Int?)
}

extension MixtureViewController: SpiritInputDelegate {
    func didSaveSpirit(volume: Double, strength: Double, temperature: Double, at index: Int?) {
        if let index = index {
            spirits[index] = (volume: volume, strength: strength, temperature: temperature)
        } else {
            spirits.append((volume: volume, strength: strength, temperature: temperature))
        }
        updateUI()
    }
}
