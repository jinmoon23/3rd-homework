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
    
    var todoData: TodoVO?   // cell 에서 사용할 데이터 모델의 인스턴스 생성
    
    static let identifier = "todoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {       // 셀을 초기화 해주는 코드
        super.prepareForReuse()
        
        todoContent.textColor = .black
        todoContent.attributedText = nil
    }
    
    func setData(_ data: TodoVO) { // 셀에 표시할 데이터를 설정하는 역할
        // todo와 관련 데이터를 Label에, iscompleted와 관련된 데이터를 Switch에 각각 산입
//        todoContent.text = data.todo
        isCompletedSwitch.isOn = data.iscompleted
        
        if todoData?.iscompleted == true {
            todoContent.attributedText = data.todo.strikeThrough()
        } else {
            todoContent.attributedText = NSAttributedString(string: data.todo)
        }
    }

}
