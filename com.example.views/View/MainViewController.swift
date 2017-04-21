//
//  MainViewController.swift
//  com.example.views
//
//  Created by Oscar Estay on 21/4/17.
//  Copyright © 2017 J3j3j3. All rights reserved.
//

import UIKit
import PureLayout

class MainViewController: UIViewController {

    let contentView = UIView.newAutoLayout()
    
    let showTextLogView: UIButton = {
        let showTextLogView = UIButton.newAutoLayout()
        showTextLogView.backgroundColor = UIColor.black
        showTextLogView.setTitle(NSLocalizedString("Entrada de Texto", comment: ""), for: [])
        showTextLogView.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
        return showTextLogView
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(contentView)
        contentView.addSubview(showTextLogView)

        
        view.setNeedsUpdateConstraints() // bootstrap Auto Layout
    }
    
    
    func pressButton(button: UIButton) {
        let vc = TextLogViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    var shouldSetupConstraints = true
    
    override func updateViewConstraints() {
        
        if (shouldSetupConstraints) {
            
            
            contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
            contentView.autoMatch(.width, to: .width, of: view)
            
            showTextLogView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
            showTextLogView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            showTextLogView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            showTextLogView.autoSetDimension(.height, toSize: 50.0)
            
            
            
            shouldSetupConstraints = false
        }
        
        super.updateViewConstraints()
    }
    
}
