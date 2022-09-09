//
//  ViewController.swift
//  UTCTime
//
//  Created by Yujean Cho on 2022/09/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dateTimeLabel: UILabel!
    
    @IBAction func onYesterday() {
        viewModel.moveDay(day: -1)
    }
    
    @IBAction func onNow() {
        dateTimeLabel.text = "Loading.."
        viewModel.reload()
    }
    
    @IBAction func onTomorrow() {
        viewModel.moveDay(day: 1)
    }
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.dateTimeLabel?.text = self?.viewModel.dateTimeString
            }
        }
        
        viewModel.reload()
    }
}

