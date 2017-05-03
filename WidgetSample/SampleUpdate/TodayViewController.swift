//
//  TodayViewController.swift
//  SampleUpdate
//
//  Created by SunilMaurya on 02/05/17.
//  Copyright © 2017 SunilMaurya. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var detailedView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Helper method
    fileprivate func initialUISetup() {
        homeButton.layer.cornerRadius = 2.0
        nextButton.layer.cornerRadius = 2.0
        profileImageView.layer.cornerRadius = 40.0
    }
    
    //MARK:- Action Methods
    @IBAction func nextButtonClicked(_ sender: Any) {
        print("next tapped")
        let url = "skmwidget://?" + "type=NEXT"
        if let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let myAppUrl = URL(string: encodedUrl)!
            extensionContext?.open(myAppUrl, completionHandler: { (success) in
                if (!success) {
                    // let the user know it failed
                }
            })
        }
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
        print("home tapped")
        let url = "skmwidget://?" + "type=HOME"
        if let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let myAppUrl = URL(string: encodedUrl)!
            extensionContext?.open(myAppUrl, completionHandler: { (success) in
                if (!success) {
                    // let the user know it failed
                }
            })
        }
    }
    
@available(iOSApplicationExtension 10.0, *)
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }

    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if (activeDisplayMode == NCWidgetDisplayMode.compact) {
            self.preferredContentSize = CGSize(width: 0.0, height: 130.0)
        }
        else {
            self.preferredContentSize = CGSize(width: 0.0, height: 270.0)
        }
    }
    
}
