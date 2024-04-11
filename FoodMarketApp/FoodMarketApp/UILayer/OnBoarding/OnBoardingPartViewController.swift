import UIKit


class OnBoardingPartViewController: UIViewController {
    //MARK: - Properties
    var image: UIImage { 
        didSet { imageView.image = image } }
    var titleText: String { 
        didSet { titleLabel.text = titleText } }
    var descriptionText: String {
        didSet { descriptionLabel.text = descriptionText } }

    //MARK: - Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    //MARK: - Initialers
    init(image: UIImage, titleText: String, descriptionText: String) {
        self.image = image
        self.titleText = titleText
        self.descriptionText = descriptionText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

    //MARK: - Layout
private extension OnBoardingPartViewController {
    func setupLayout(){
        setupImageView()
        setupTitle()
        setupDescription()
    }
    
    func setupImageView(){
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setupTitle(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        titleLabel.textColor = AppColors.white
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func setupDescription(){
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .Roboto.regular.size(of: 14)
        descriptionLabel.textColor = AppColors.white
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 23),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
