Al clonar, hacer ` pod install ` en la carpeta, luego, abrir el archivo .xcworkspace (no el .xcodeproj)

Para crear una vista, se crea un controlador, como:
```swift
//
//  TextLogViewController.swift
//
//
//  Created by Oscar Estay on 20/4/17.
//
//

import UIKit
import PureLayout // Importar la libreria

class TextLogViewController: UIViewController {
    
    let scrollView  = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()
    
    // Se pueden crear funciones con los elementos a crear

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
    
    let showTextLogView: UIButton = {
        let showTextLogView = UIButton.newAutoLayout()
        showTextLogView.backgroundColor = UIColor.black
        showTextLogView.setTitle(NSLocalizedString("Entrada de Texto", comment: ""), for: [])
        // Asi se agrega la acción del boton
        showTextLogView.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
        return showTextLogView
    }()

    var textLogTitleInput: UITextField = {
        let textLogTitleInput = UITextField.newAutoLayout()
        textLogTitleInput.layer.borderColor = UIColor(red: 186/255, green: 186/255, blue: 186/255, alpha: 1.0).cgColor
        textLogTitleInput.backgroundColor = UIColor.white
        textLogTitleInput.layer.borderWidth = 1.0;
        textLogTitleInput.layer.cornerRadius = 5.0;
        return textLogTitleInput
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        // No es necesario que la estructura sea scrollView > contentView > sus cosas (Ver MainViewController)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textLogTitle)
        
        view.setNeedsUpdateConstraints()
    }
    
    var shouldSetupConstraints = true
    
    override func updateViewConstraints() {
        
        if (shouldSetupConstraints) {
            // Esto hace que sea del tamaño de la pantalla
            scrollView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
            
            contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
            // Se puede hacer que se tenga el mismo tamaño que otra propiedad de otra view
            contentView.autoMatch(.width, to: .width, of: view)

            // Agregar Constraints de sus views acá

            shouldSetupConstraints = false
        }
        super.updateViewConstraints()
    }

    func pressButton(button: UIButton) {
        let vc = TextLogViewController()
        // Así se envía a otra vista, hay que revisar como mandar info
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

```

[Para ver demos]: https://github.com/PureLayout/PureLayout/tree/master/PureLayout/Example-iOS
[La librería]: https://github.com/PureLayout/PureLayout/
