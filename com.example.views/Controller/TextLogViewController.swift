//
//  TextLogViewController.swift
//
//
//  Created by Oscar Estay on 20/4/17.
//
//

import UIKit
import PureLayout

class TextLogViewController: UIViewController {
    
    let scrollView  = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()
    
    let textLogTitle: UILabel = {
        let textLogTitle = UILabel.newAutoLayout()
        textLogTitle.backgroundColor = UIColor.white
        textLogTitle.font = UIFont.systemFont(ofSize: 25)
        textLogTitle.numberOfLines = 0
        textLogTitle.textAlignment = NSTextAlignment.center
        textLogTitle.lineBreakMode = .byClipping
        textLogTitle.textColor = UIColor.black
        textLogTitle.text = NSLocalizedString("Crear entrada", comment: "")
        return textLogTitle
    }()
    
    var textLogTitleLabel: UILabel = {
        let textLogTitle = UILabel.newAutoLayout()
        textLogTitle.backgroundColor = UIColor.white
        textLogTitle.font = UIFont.systemFont(ofSize: 17)
        textLogTitle.numberOfLines = 0
        textLogTitle.textAlignment = NSTextAlignment.center
        textLogTitle.lineBreakMode = .byClipping
        textLogTitle.textColor = UIColor.black
        textLogTitle.text = NSLocalizedString("Título", comment: "")
        return textLogTitle
    }()
    
    var textLogTitleInput: UITextField = {
        let textLogTitleInput = UITextField.newAutoLayout()
        textLogTitleInput.layer.borderColor = UIColor(red: 186/255, green: 186/255, blue: 186/255, alpha: 1.0).cgColor
        textLogTitleInput.backgroundColor = UIColor.white
        textLogTitleInput.layer.borderWidth = 1.0;
        textLogTitleInput.layer.cornerRadius = 5.0;
        return textLogTitleInput
    }()
    
    var textLogDescriptionLabel: UILabel = {
        let textLogDescriptionLabel = UILabel.newAutoLayout()
        textLogDescriptionLabel.backgroundColor = UIColor.white
        textLogDescriptionLabel.font = UIFont.systemFont(ofSize: 17)
        textLogDescriptionLabel.numberOfLines = 0
        textLogDescriptionLabel.textAlignment = NSTextAlignment.center
        textLogDescriptionLabel.lineBreakMode = .byClipping
        textLogDescriptionLabel.textColor = UIColor.black
        textLogDescriptionLabel.text = NSLocalizedString("Descripción", comment: "")
        return textLogDescriptionLabel
    }()
    
    var textLogDescriptionInput: UITextView = {
        let textLogDescriptionInput = UITextView.newAutoLayout()
        textLogDescriptionInput.layer.borderColor = UIColor(red: 186/255, green: 186/255, blue: 186/255, alpha: 1.0).cgColor
        textLogDescriptionInput.backgroundColor = UIColor.white
        textLogDescriptionInput.layer.borderWidth = 1.0;
        textLogDescriptionInput.layer.cornerRadius = 5.0;
        return textLogDescriptionInput
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textLogTitle)
        contentView.addSubview(textLogTitleLabel)
        contentView.addSubview(textLogTitleInput)
        contentView.addSubview(textLogDescriptionLabel)
        contentView.addSubview(textLogDescriptionInput)
        
        view.setNeedsUpdateConstraints() // bootstrap Auto Layout
    }
    
    var shouldSetupConstraints = true
    
    override func updateViewConstraints() {
        
        if (shouldSetupConstraints) {
            
            
            scrollView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
            
            contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
            contentView.autoMatch(.width, to: .width, of: view)
            
            textLogTitle.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
            textLogTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            textLogTitle.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            textLogTitle.autoSetDimension(.height, toSize: 50.0)
            
            textLogTitleLabel.autoPinEdge(.top, to: .bottom, of: textLogTitle)
            textLogTitleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            textLogTitleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            textLogTitleLabel.autoSetDimension(.height, toSize: 30.0)
            
            textLogTitleInput.autoPinEdge(.top, to: .bottom, of: textLogTitleLabel)
            textLogTitleInput.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            textLogTitleInput.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            textLogTitleInput.autoSetDimension(.height, toSize: 50.0)
            
            textLogDescriptionLabel.autoPinEdge(.top, to: .bottom, of: textLogTitleInput)
            textLogDescriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            textLogDescriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            textLogDescriptionLabel.autoSetDimension(.height, toSize: 30.0)
            
            textLogDescriptionInput.autoPinEdge(.top, to: .bottom, of: textLogDescriptionLabel)
            textLogDescriptionInput.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            textLogDescriptionInput.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            textLogDescriptionInput.autoSetDimension(.height, toSize: 350.0)

            
            shouldSetupConstraints = false
        }
        
        super.updateViewConstraints()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
