//
//  ViewController.swift
//  StopWatch
//
//  Created by Nguyen Le Vu Long on 12/23/16.
//  Copyright © 2016 Nguyen Le Vu Long. All rights reserved.
//
//đm long lin 

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: Properties
    @IBOutlet weak var leftButton: CustomButtonClass!
    @IBOutlet weak var rightButton: CustomButtonClass!
    @IBOutlet weak var recordTable: UITableView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var isRunning = false {
        didSet {
            if isRunning == true {
                drawButton(leftButton, text: "Lap", color: color.white)
                drawButton(rightButton, text: "Stop", color: color.orange)
                mainTimer.start()
                mainNSTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                    self.timerLabel.text = self.mainTimer.inString
                }
            } else {
                drawButton(leftButton, text: "Reset", color: color.white)
                drawButton(rightButton, text: "Start", color: color.blue)
                mainNSTimer.invalidate()
                mainTimer.pause()
            }
        }
    }
    var mainTimer = customTimer()
    var mainNSTimer = Timer()
    var records = [String]()
    
    // helper
    struct color {
        static let blue = UIColor(red:0.29, green:0.95, blue:0.76, alpha:1.0)
        static let white = UIColor(red:0.70, green:0.87, blue:0.86, alpha:1.0)
        static let orange = UIColor(red:0.97, green:0.41, blue:0.00, alpha:1.0)
        static let black = UIColor(red:0.07, green:0.07, blue:0.07, alpha:1.0)
    }
    static let DocumentDir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDir.appendingPathComponent("stopwatchRecords")

    override func viewDidLoad() {
        super.viewDidLoad()
        //View
        view.backgroundColor = color.black
        
        //Timer Label
        timerLabel.textColor = color.blue
        
        // Record Table
        recordTable.dataSource = self
        recordTable.delegate = self
        recordTable.separatorColor = color.blue
        recordTable.backgroundColor = UIColor.clear
        
        //Button
        drawButton(leftButton, text: "Reset", color: color.white)
        drawButton(rightButton, text: "Start", color: color.blue)
        
        //Load data
        records = loadRecords()
        recordTable.reloadData()
        if records.count > 0 {
            recordTable.scrollToRow(at: IndexPath(row: records.count - 1, section: 0), at: .bottom, animated: false)
        }
    }
    
    //MARK: recordTable datasource and delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as? RecordTableViewCell else {
            fatalError("Unable to fetch Deque reusable cell")
        }
        cell.orderNumber.text = String(indexPath.row + 1) + "."
        cell.recordTime.text = records[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: Button Actions
    @IBAction func leftButtonAction(_ sender: UIButton) {
        if isRunning { //Lap
            let newIndexPath = IndexPath(row: records.count, section: 0)
            records.append(timerLabel.text!)
            recordTable.insertRows(at: [newIndexPath], with: .top)
            recordTable.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        } else { //Reset
            records.removeAll()
            recordTable.reloadData()
            mainTimer.reset()
            timerLabel.text = "00:00,00"
        }
        saveRecords()
    }
    @IBAction func rightButtonAction(_ sender: UIButton) {
        isRunning = !isRunning
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Private Methods
    private func drawButton(_ button: CustomButtonClass, text: String, color: UIColor) {
        button.changeColor(color)
        button.setTitle(text, for: .normal)
    }
    private func saveRecords() {
        NSKeyedArchiver.archiveRootObject(records, toFile: ViewController.ArchiveURL.path)
    }
    private func loadRecords() -> [String] {
        guard let records = NSKeyedUnarchiver.unarchiveObject(withFile: ViewController.ArchiveURL.path) as? [String] else {
            NSLog("Unable to load records savedata")
            return [String]()
        }
        return records
    }
}

