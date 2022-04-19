//
//  CLOwnHeadView.swift
//  CLOwnKit_Example
//
//  Created by admin on 2022/4/15.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift

class CLOwnHeadView: UIView {
    fileprivate lazy var disposeBag = DisposeBag()
    lazy var hButton : UIButton = {
        let hb = UIButton.init()
        let bundleUrl = Bundle.main.url(forResource: "CLOwnKit", withExtension: "bundle")
        let sourceBundle = Bundle.init(url:bundleUrl!)
        if let pngUrl = Bundle.pngUrl(sourceBundle:sourceBundle!, fileName: "table_bg_busy"){
            hb.setBackgroundImage(UIImage(contentsOfFile: pngUrl), for: .normal)
        }
        hb.setTitle("China", for: .normal)
        hb.rx.tap.subscribe(onNext:{
            print("点击了这里")
        }).disposed(by: disposeBag)
        return hb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(hButton)
        hButton.snp_makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(120)
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
