
// MARK: - Delegate Protocols
protocol RawSpiritInputDelegate: AnyObject {
    func didSaveRawSpirit(volume: Double, strength: Double, temperature: Double)
}

protocol PercentageInputDelegate: AnyObject {
    func didSavePercentage(_ percentage: Double, forKey: String)
}

protocol SpeedInputDelegate: AnyObject {
    func didSaveSpeeds(headsSpeed: Double?, bodySpeed: Double?)
}
