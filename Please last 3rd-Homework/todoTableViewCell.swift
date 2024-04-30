//
//  todoTableViewCell.swift
//  Please last 3rd-Homework
//
//  Created by 최진문 on 2024/03/26.
//

import UIKit

class todoTableViewCell: UITableViewCell {
    
    
    @IBOutlet var todoContent: UILabel!
    @IBOutlet var isCompletedSwitch: UISwitch!
    
    
    static let identifier = "todoTableViewCell"
    
    override func prepareForReuse() { // 셀을 초기화 해주는 코드
        super.prepareForReuse()
        
        todoContent.textColor = .black
        todoContent.attributedText = nil
    }
    
    func setData(_ data: TodoVO) { // 셀에 표시할 데이터를 설정하는 역할
        isCompletedSwitch.isOn = data.iscompleted
        
        if data.iscompleted == true {
            todoContent.attributedText = data.todo.strikeThrough()
        } else {
            todoContent.attributedText = NSAttributedString(string: data.todo)
        }
    }
    
}
