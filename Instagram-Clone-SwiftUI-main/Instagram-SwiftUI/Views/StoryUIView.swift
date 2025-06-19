import UIKit

class StoryUIView: UIView {
    // MARK: - UI Components
    private let gradientBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemBackground
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemRed.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemRed.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        return gradient
    }()
    
    // MARK: - Initialization
    init(story: Story) {
        super.init(frame: .zero)
        setupUI()
        configure(with: story)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .clear
        
        // Add views
        addSubview(gradientBorderView)
        addSubview(imageView)
        addSubview(usernameLabel)
        
        // Add gradient to border view
        gradientBorderView.layer.addSublayer(gradientLayer)
        
        NSLayoutConstraint.activate([
            // Gradient border view
            gradientBorderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            gradientBorderView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            gradientBorderView.widthAnchor.constraint(equalToConstant: 64),
            gradientBorderView.heightAnchor.constraint(equalToConstant: 64),
            
            // Image view - slightly smaller to show gradient border
            imageView.centerXAnchor.constraint(equalTo: gradientBorderView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: gradientBorderView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            
            // Username label
            usernameLabel.topAnchor.constraint(equalTo: gradientBorderView.bottomAnchor, constant: 4),
            usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameLabel.widthAnchor.constraint(equalToConstant: 80),
            usernameLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        // Make views circular
        imageView.layer.cornerRadius = 30
        gradientBorderView.layer.cornerRadius = 32
        gradientBorderView.clipsToBounds = true
        
        // Add white background behind image
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(backgroundView, belowSubview: imageView)
        backgroundView.frame = imageView.frame
        backgroundView.layer.cornerRadius = 30
        backgroundView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            backgroundView.heightAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = gradientBorderView.bounds
        
        // Create circular mask for gradient
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(ovalIn: gradientBorderView.bounds).cgPath
        gradientLayer.mask = maskLayer
    }
    
    // MARK: - Configuration
    func configure(with story: Story) {
        imageView.image = UIImage(named: story.user.userImage)
        usernameLabel.text = story.user.userName
    }
}
