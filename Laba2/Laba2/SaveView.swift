//
//  SaveView.swift
//  Laba2
//
//  Created by Илья Волынец on 16.11.21.
//

import Foundation
import UIKit

class SaveView: UIViewController {
    @IBOutlet weak var saveTable: UITableView!
    var pickheight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveTable.rowHeight = UITableView.automaticDimension
        saveTable.estimatedRowHeight = 44
        saveTable.register(UINib.init(nibName: "CustomeCell", bundle: nil), forCellReuseIdentifier: "cel")
      

        self.saveTable.reloadData()
    }
    
        
}


extension SaveView: UITableViewDataSource, UITableViewDelegate{
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Base.shared.weathers.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    
    let cell = saveTable.dequeueReusableCell(withIdentifier: "cel") as! CustomeCell
//    var cell:UITableViewCell!
//    if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell"){
//        cell = dCell
//    }else{
//        cell = UITableViewCell()
//    }
    cell.myLabel.text = Base.shared.weathers[indexPath.row].nam
   
    return cell
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    

}

