//
//  CLOwnViewController.swift
//  CLOwnKit_Example
//
//  Created by admin on 2022/4/15.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SnapKit

public class CLOwnViewController : UIViewController{
    fileprivate lazy var bag = DisposeBag()
    lazy var table : UITableView = {
        let table = UITableView.init(frame: view.frame, style: .grouped)
        let bundleUrl = Bundle.main.url(forResource: "CLOwnKit", withExtension: "bundle")
        let cBundle = Bundle.init(url: bundleUrl!)
        table.register(UINib.init(nibName: "CLOwnTableViewCell", bundle: cBundle), forCellReuseIdentifier: "OwnTableViewCell")
        table.tableHeaderView = CLOwnHeadView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 120))
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            table.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        self.view.addSubview(table)
        table.snp_makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0))
        }
    }
}
extension CLOwnViewController : UITableViewDataSource,UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnTableViewCell", for: indexPath) as! CLOwnTableViewCell
        return cell
    }
}
    
