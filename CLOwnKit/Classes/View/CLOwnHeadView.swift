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
        let cbundle = Bundle.init(for: self.classForCoder)
        let cbundleName = cbundle.object(forInfoDictionaryKey: "Own.bundle")
//        let cbundleDic = String(format: "%@.bundle", cbundleName as! CVarArg)
        let pPath = cbundle.path(forResource: "button_136_40@2x.png", ofType: nil, inDirectory: "Own.bundle")
        hb.setBackgroundImage(UIImage(contentsOfFile: pPath!), for: .normal)
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
