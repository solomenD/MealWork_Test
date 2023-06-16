//
//  WorkOutViewController.swift
//  MealWork_TEST
//
//  Created by Solomon  on 15.06.2023.
//

import UIKit
import SnapKit

class WorkOutViewController: BaseController, UITableViewDataSource, UITableViewDelegate{
    
    let backgrounView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        return view
    }()
    
    let toDoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.firstDayLabel
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Resourses.redColor
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.execiseLabel
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    let infoQuantutyWorkout: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.countOfRepsLabel
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Resourses.gray
        return label
    }()
    
    let infoExerciseyWorkout: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.infiExeciseLabel
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.identefier)
        return table
    }()
    
    let startedExerciseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resourses.redColor
        button.setTitle(Resourses.Text.startExrciseLabel, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func setupViews() {
        for _ in 1...10 {
            arrayOfModel.append( WorkCellModel(heightOfRow: 80, iconeImageName: "workoutMan", nameTitleLabel: "Станова тяга", infoTitleLbel: "15 повторень х 3 підходи х --кг", tableView: 4, isHiden: true, isActiveTableView: false))
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .white
        view.addSubview(backgrounView)
        backgrounView.addSubview(toDoTitleLabel)
        backgrounView.addSubview(mainTitleLabel)
        backgrounView.addSubview(infoQuantutyWorkout)
        backgrounView.addSubview(infoExerciseyWorkout)
        view.addSubview(tableView)
        view.addSubview(startedExerciseButton)
        addNavBarButton(at: .left, with: Resourses.Images.multiply)
    }
    
    override func navBarLeftButtontHandler() {
        navigationController?.popViewController(animated: true)
        
    }
    
    override func configureAppearance() {
        
    }
    
    override func constaintViews() {
        
        backgrounView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets)
            make.width.equalTo(view)
            make.height.equalTo(260)
        }
        
        toDoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgrounView.snp.top).inset(100)
            make.left.equalTo(12)
        }
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(toDoTitleLabel).inset(20)
            make.left.equalTo(10)
        }
        infoQuantutyWorkout.snp.makeConstraints { make in
            make.leading.equalTo(12)
            make.top.equalTo(mainTitleLabel.snp.bottom).inset(-15)
        }
        infoExerciseyWorkout.snp.makeConstraints { make in
            make.leading.equalTo(12)
            make.top.equalTo(infoQuantutyWorkout.snp.bottom).inset(-15)
            make.trailing.equalTo(-12)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backgrounView.snp.bottom)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(startedExerciseButton.snp.centerY)
        }
        startedExerciseButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(-15)
            make.leading.equalTo(15)
            make.height.equalTo(50)
        }
        
    }
    
    var settingsIsOpen = false
    
    var arrayOfModel: [WorkCellModel] = []
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if arrayOfModel[indexPath.row].isHiden == false {
                arrayOfModel[indexPath.row].isHiden = true
                arrayOfModel[indexPath.row].heightOfRow = 80
            }else {
                arrayOfModel[indexPath.row].isHiden = false
                arrayOfModel[indexPath.row].heightOfRow = arrayOfModel[indexPath.row].tableView*60
            }
            self.tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(arrayOfModel[indexPath.row].heightOfRow)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.identefier, for: indexPath) as! WorkoutTableViewCell
//        cell.dotButtonTapped {
//            if cell.isActiveButton == false {
//                arrayOfModel[indexPath.row].isHiden = true
//                arrayOfModel[indexPath.row].heightOfRow = 80
//            } else if cell.isActiveButton {
//                arrayOfModel[indexPath.row].isHiden = false
//                arrayOfModel[indexPath.row].heightOfRow = arrayOfModel[indexPath.row].tableView*60
//            }
//        }
        
        if arrayOfModel[indexPath.row].isHiden == false {
            cell.tableView.isHidden = false
        } else if arrayOfModel[indexPath.row].isHiden {
            cell.tableView.isHidden = true
        }
        
        return cell
    }
    
    
}
