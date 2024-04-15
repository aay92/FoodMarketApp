import UIKit

//MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {
    //MARK: - Properties
    private var pages = [OnBoardingPartViewController]()
    
    //MARK: - Views
    private var pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let bottomButton = UIButton()

    weak var viewOutput: OnboardingViewOutput!
    
    init(pages: [OnBoardingPartViewController] = [OnBoardingPartViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
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
//MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPress(){
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            ///Указываем напралвение
            pageViewController.setViewControllers(
                [pages[1]],
                direction: .forward,
                animated: true,
                completion: nil)
            bottomButton.setTitle(pages[1].buttonText, for: .normal)

        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers(
                [pages[2]],
                direction: .forward,
                animated: true,
                completion: nil)
            bottomButton.setTitle(pages[2].buttonText, for: .normal)

        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers(
                [pages[3]],
                direction: .forward,
                animated: true,
                completion: nil)
            bottomButton.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            print("Exit")
        default:
            break
        }
    }
}

//MARK: - Setup Layout
private extension OnboardingViewController {
    func setupLayout(){
        setupViewController()
        setupPageControll()
        setupBottomButton()
        setupView()
    }
    
    func setupViewController(){
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers(
            [pages.first!],
            direction: .forward,
            animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.didMove(toParent: self)
    }
    
    func setupView(){
        view.backgroundColor = AppColors.accentOrange
    }
    
    func setupPageControll(){
        pageControl.numberOfPages = pages.count
        pageControl.numberOfPages = 0
        let page = pages[0]
        let title = page.titleText
        bottomButton.setTitle(title, for: .normal)
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    
    func setupBottomButton(){
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.backgroundColor = AppColors.grey
        bottomButton.titleLabel?.font = .Roboto.bold.size(of: 18)
        bottomButton.layer.cornerRadius = 16
        bottomButton.setTitleColor(AppColors.black, for: .normal)
        
        view.addSubview(bottomButton)
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -44),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnBoardingPartViewController), 
                currentIndex > 0 else {
            return nil }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnBoardingPartViewController),
                currentIndex < pages.count - 1 else {
            return nil }
        
        return pages[currentIndex + 1]
    }
}

//MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnBoardingPartViewController) {
            pageControl.currentPage = index
            let page = pages[index]
            let title = page.titleText
            bottomButton.setTitle(title, for: .normal)
        }
    }
}
