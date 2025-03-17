import UIKit

final class FloatingTabBar: UITabBar {
    private let customHeight: CGFloat = 70
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = customHeight
        return size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTabBarlayout()
    }

}
//MARK: - setupTabBarlayout()
private extension FloatingTabBar {
    func setupTabBarlayout() {
        guard let superview = superview else {
            print("Superview is nil!")
            return
        }
        
        let horizontalInset: CGFloat = 10
        let bottomInset: CGFloat = 25
        
        let newWidth = superview.frame.width - 2 * horizontalInset
        let newX = horizontalInset
        let newY = superview.frame.height - customHeight - bottomInset
        
        guard newWidth > 0 else {
            print("Invalid width calculated:", newWidth)
            return
        }
        
        frame = CGRect(
            x: newX,
            y: newY,
            width: newWidth,
            height: customHeight
        )
        
        layer.cornerRadius = customHeight / 3
        layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 10
    }
}
