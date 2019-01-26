import UIKit
import AVFoundation

class TaskViewController: UIViewController, TaskViewProtocol, AVAudioPlayerDelegate {
    
    
    var presenter: TaskPresenterProtocol?
    
    
    
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var topConstGreenView: NSLayoutConstraint!
    @IBOutlet weak var topConstTitle: NSLayoutConstraint!
    @IBOutlet weak var butPause: UIButton!
    @IBOutlet weak var topConstraintBubbles: NSLayoutConstraint!
    @IBOutlet weak var butStop: UIButton!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labMinutes: UILabel!
    @IBOutlet weak var labSeconds: UILabel!
    @IBOutlet weak var viewUnderBubbles: UIView!
    @IBOutlet weak var labLeftTime: UILabel!
    
    
    var indexOfCurrentTask = 0
    var nameOfCurrentTask = ""
    var arrayOfMinutesAndSeconds = [String]() {
        didSet {
            setMinutesAndSeconds(arr: arrayOfMinutesAndSeconds)
            if arrayOfMinutesAndSeconds == [String(Settings.standard.workMinutes),"0"] {
                setTextAndColorOfStartButton()
            }
        }
    }
    var currentTheme: MyTheme?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingPack()
        addGradients()
        
        
        presenter?.checkTimer()
        NotificationCenter.default.addObserver(self, selector: #selector(checkTimer), name: NSNotification.Name(rawValue: "fg"), object: nil)
        print("observer added")
    }
    
    
    @objc func checkTimer() {
        print("check")
        
        presenter?.checkTimer()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        animateBubbles()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        setTextAndColorOfStartButton()
        
    }
    
    
    func setTheme() {
        
        let curentThemename = UserDefaults.standard.string(forKey: "theme") ?? "Red Rose"
        let currentTheme = Themes(rawValue: curentThemename)!
        
        self.currentTheme = MyTheme(theme: currentTheme)
    }
    
    
    @IBAction func butStartPauseTapped(_ sender: UIButton) {
        
        presenter!.startButtonTapped()
        UserDefaults.standard.set(indexOfCurrentTask, forKey: "indexOfCurrentTask")
        setTextAndColorOfStartButton()
        
    }
    
    
    @IBAction func butStopTapped(_ sender: UIButton) {
        presentSureAlert()
        UserDefaults.standard.removeObject(forKey: "currentTask")
    }
    
    
    func addGradients() {
        
        let color1a = currentTheme!.mainColor.cgColor
        let color2a = currentTheme!.darkenColor.cgColor
        
        self.view.addGradient(colors: [color2a, color1a])
    }
    
    
    func setMinutesAndSeconds(arr: [String]) {
        labMinutes.text = arr.first
        labSeconds.text = arr.last
    }
    
    
    func setTextAndColorOfStartButton() {
        let paused = UserDefaults.standard.bool(forKey: "timerPaused")
        let enabled = UserDefaults.standard.bool(forKey: "timerEnabled")
        
        if paused {
            
            butPause.setTitle(NSLocalizedString("Продолжить", comment: "продолжить") , for: .normal)
            
        } else {
            
            if enabled {
                
                butPause.setTitle(NSLocalizedString("Пауза", comment: "пауза"), for: .normal)
                
            } else {
                
                butPause.setTitle(NSLocalizedString("Начать", comment: "начать"), for: .normal)
                
            }
        }
    }
    
    
    // ANIMATE BUBBLES
    func animateBubbles() {
        UIView.animate(withDuration: 10,
                       animations: {
                        self.topConstraintBubbles.constant = -200
                        self.view.layoutIfNeeded()
        },
                       completion: { done in
                        self.topConstraintBubbles.constant = 0
                        self.view.layoutIfNeeded()
                        self.animateBubbles()
        })
    }
    
    
    // STARTING PACK OF THIS VIEW
    func startingPack() {
        
        labMinutes.text = "\(Settings.standard.workMinutes)"
        
        setTheme()
        
        butStop.layer.cornerRadius = 15
        butPause.layer.cornerRadius = 15
        if UIScreen.main.bounds.height == 568 {
            topConstTitle.constant -= 40
        }
        
        viewUnderBubbles.backgroundColor = currentTheme?.mainColor
        
        nameOfCurrentTask = presenter!.getTaskName(byIndex: indexOfCurrentTask)
        labName.text = nameOfCurrentTask
    }
    
    
    // CLOSE BUTTON TAPPED
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        presentSureAlert()
    }
    
    
    func presentSureAlert() {
        let alert = UIAlertController()
        alert.title = NSLocalizedString("Закрыть задачу?", comment: "закрытие задачи")
        let yesAction = UIAlertAction(title: NSLocalizedString("Да", comment: "yes"), style: .default) { (action) in
            self.presenter?.closeButtonTapped()
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("Отмена", comment: "cancel") , style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(yesAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func setLevelOfBubbles(proportion: Float, type: TimerTypes) {
        
        
        var color: UIColor = #colorLiteral(red: 0.2784313725, green: 0.8941176471, blue: 0.7607843137, alpha: 1)
        var text = NSLocalizedString("Осталось:", comment: "Осталось")
        if type == .relax {
            color = #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
            text = NSLocalizedString("Перерыв", comment: "отдых")
        }
        
        labLeftTime.text = text
        
        UIView.animate(withDuration: 0.7) {
            self.greenView.backgroundColor = color
            self.topConstGreenView.constant = CGFloat(200 - proportion * 200)
        }
        
        
    }
    
    
    // STATUS BAR
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "fg"), object: nil)
    }
    
    
}
