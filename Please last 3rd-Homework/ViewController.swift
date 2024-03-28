//
//  ViewController.swift
//  Please last 3rd-Homework
//
//  Created by 최진문 on 2024/03/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad( ) {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
   
    
    @IBAction func addList(_ sender: Any) {
        let title = "할 일 추가"
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "추가", style: .default) {(_) in
            if let title = alert.textFields?[0].text {
                let toDo = TodoVO(todo: title ,iscompleted: false)
                TodoVO.todoSources.append(toDo)
                self.tableView.reloadData() // 테이블 뷰를 새로고침함 -> 안하면 추가 안됨
                
            }
        }
        alert.addAction(cancel)
        alert.addAction(add)
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "할 일을 입력해주세요"
        })
        
        self.present(alert, animated: false)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                
                TodoVO.todoSources.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
        }
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoVO.todoSources.count // sampleDate의 element 수 만큼 row 생성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: todoTableViewCell.identifier, for: indexPath) as? todoTableViewCell else { return UITableViewCell() }

        // 테이블 뷰의 셀을 구성하는 역할
        cell.setData(TodoVO.todoSources[indexPath.row])
        cell.isCompletedSwitch?.tag = indexPath.row  // 각 셀의 UISwitch를 tag로 구분
        return cell
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        
        TodoVO.todoSources[sender.tag].iscompleted = sender.isOn
        //         print(sender.tag)
        
        if sender.isOn {
            TodoVO.todoSources[sender.tag].iscompleted = true // 스위치가 on 되면 소스 데이터의 iscompleted도 true 값이 되도록 설정함
            self.tableView.reloadData()
        } else {
            TodoVO.todoSources[sender.tag].iscompleted = false // 스위치가 off 되면 소스 데이터의 iscompleted도 false 값이 되도록 설정함
            self.tableView.reloadData()
        }
    }
    
}

    
    
    
    
    
    
    
    
    

    
    

