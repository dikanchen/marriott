//
//  CalendarViewController.swift
//  Marriott
//
//  Created by User on 3/12/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import JTAppleCalendar

var dateStr = [Character]()
var enddateStr = [Character]()
var endStr2 = [Character]()
var datenumber2 = ""
var enddatenumber2 = ""
var datenumber = ""
var enddatenumber = ""
var days = 0
var recordfirstDate: Date?

class CalendarViewController: UIViewController, JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    
    let formatter = DateFormatter()
    var firstDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let date = Date()
        let calender = Calendar.current
        
        let month = calender.component(.month, from: date)
        let year = calender.component(.year, from: date)
        
        calendarView.allowsMultipleSelection = true
        calendarView.isRangeSelectionUsed = true
        
        monthLabel.text = String(format: "%02d", month)
        yearLabel.text = "\(year)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        handleSelection(cell: cell, cellState: cellState)
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let date = Date()
        let calender = Calendar.current
        
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let year = calender.component(.year, from: date)
        
        formatter.dateFormat = "MM dd yyyy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "\(month) \(day) \(year)")
        let endDate = formatter.date(from: "12 31 2099")
        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        cell.dateLabel.text = cellState.text
        if cellState.isSelected{
            cell.selectedView.isHidden = false
        }else{
            cell.selectedView.isHidden = true
        }
        let date = Date()
        let calender = Calendar.current
        
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let year = calender.component(.year, from: date)
        
        let today = formatter.date(from: "\(month) \(day) \(year)")
        if today?.compare(cellState.date) == .orderedSame{
            cell.selectedView.isHidden = false
            cell.selectedView.backgroundColor = UIColor.orange
        }
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        if firstDate != nil {
            calendarView.selectDates(from: firstDate!, to: date,  triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)
        } else {
            firstDate = date
        }
        var arraystr = Array(String(describing: firstDate))
        print(arraystr)
        for i in 9..<19{
            if dateStr.count < 10{
                dateStr.append(arraystr[i])
            }
        }
        
        var newarray = Array(String(describing: date))
        print(newarray)
        for j in 0..<10{
            enddateStr.append(newarray[j])
        }
        
        if enddateStr.count > 10{
            for k in enddateStr.count-10..<enddateStr.count{
                if endStr2.count < 10{
                    endStr2.append(enddateStr[k])
                }
            }
        }
        
        datenumber2 = String(dateStr)
        enddatenumber2 = String(endStr2)
        print(datenumber2)
        print(enddatenumber2)
        days = Calendar.current.dateComponents([.day], from: firstDate!, to: date).day!
        if days < 0{
            createAlert(title: "Warning", message: "end date can't be earlier than start date")
            firstDate = nil
            dateStr.removeAll()
            enddateStr.removeAll()
            endStr2.removeAll()
        }
        
        continueBtn.setTitle("Continue with \(days) nights", for: .normal)
        
        let date = Date()
        let calender = Calendar.current
        
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let year = calender.component(.year, from: date)
        
        guard let today = formatter.date(from: "\(month) \(day) \(year)") else{return}
        
        if firstDate?.compare(today) == .orderedAscending{
            createAlert(title: "Warning", message: "start date can't be earlier than today")
            firstDate = nil
            dateStr.removeAll()
            enddateStr.removeAll()
            endStr2.removeAll()
        }
        //dateStr.append(String(describing: firstDate))
        //dateStr.append(String(describing: date))
        //print(dateStr)

    }
    
    func handleSelection(cell: JTAppleCell?, cellState: CellState) {
        let validCell = cell as! CollectionViewCell
        switch cellState.selectedPosition(){
        case .full, .left, .right:
            validCell.selectedView.isHidden = false
        case .middle:
            validCell.selectedView.isHidden = false
        default:
            validCell.selectedView.isHidden = true
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleSelection(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy"
        yearLabel.text = formatter.string(from: date)
        formatter.dateFormat = "MM"
        monthLabel.text = formatter.string(from: date)
    }
    
    
    @IBAction func continuetapped(_ sender: Any) {
        datenumber = datenumber2
        enddatenumber = enddatenumber2
        recordfirstDate = firstDate
        if (datenumber != "" && enddatenumber != "" && dateStr.count != 0){
            firstDate = nil
            dateStr.removeAll()
            enddateStr.removeAll()
            endStr2.removeAll()
            performSegue(withIdentifier: "segue", sender: self)
        }else{
            createAlert(title: "Warning", message: "Please select both start date and end date")
        }
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
