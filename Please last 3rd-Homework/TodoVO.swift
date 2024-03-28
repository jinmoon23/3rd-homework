//
//  TodoVO.swift
//  Please last 3rd-Homework
//
//  Created by 최진문 on 2024/03/26.
//

import UIKit

class TodoVO {
    var todo: String
    var iscompleted: Bool
    init(todo: String, iscompleted: Bool) {
        self.todo = todo
        self.iscompleted = iscompleted
    }
}
extension TodoVO {
    static var todoSources: [TodoVO] = [
    TodoVO(todo: "안녕하세요!", iscompleted: false),
    TodoVO(todo: "할 일 목록을 추가하시려면", iscompleted: false),
    TodoVO(todo: "오른쪽 상단 추가하기 버튼을 클릭해주세요!", iscompleted: false)
  ]
}
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    func removeStrikethrough() -> NSAttributedString {
           let attributeString = NSMutableAttributedString(string: self)
           attributeString.removeStrikethrough()
           return attributeString
       }
}
extension NSMutableAttributedString {
    func removeStrikethrough() {
        removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, length))
    }
}
