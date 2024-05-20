//
//  ViewController.swift
//  otus-lesson-dmitry
//
//  Created by Dmitry Potapov on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {

    var custom: UIView = UIView()
    var redLabel: UILabel = UILabel()
    var greenLabel: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    var landscapeConstraints: [NSLayoutConstraint] = []
    var portraitConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height

        redLabel.translatesAutoresizingMaskIntoConstraints = false

        redLabel.text = "Label1"
        redLabel.backgroundColor = .red

        greenLabel.translatesAutoresizingMaskIntoConstraints = false

        greenLabel.text = "Label2"
        greenLabel.backgroundColor = .green

        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false

        custom.backgroundColor = .gray
        custom.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(custom)

        custom.addSubview(redLabel)
        custom.addSubview(greenLabel)
        custom.addSubview(imageView)

        redLabel.setContentHuggingPriority(UILayoutPriority(220), for: .horizontal)
        greenLabel.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)


        portraitConstraints = [
            custom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            custom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            custom.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            custom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            redLabel.topAnchor.constraint(equalTo: custom.topAnchor, constant: 10),
            redLabel.leadingAnchor.constraint(equalTo: custom.leadingAnchor, constant: 20),

            greenLabel.topAnchor.constraint(equalTo: custom.topAnchor, constant: 10),
            greenLabel.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: 10),
            greenLabel.trailingAnchor.constraint(equalTo: custom.trailingAnchor, constant: -20),

            imageView.leadingAnchor.constraint(equalTo: custom.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: custom.trailingAnchor, constant: -20),

            imageView.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: custom.centerYAnchor, constant: -(screenHeight / 10))
        ]

        landscapeConstraints = [
            custom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            custom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            custom.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            custom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            redLabel.topAnchor.constraint(equalTo: custom.topAnchor, constant: 10),
            redLabel.leadingAnchor.constraint(equalTo: custom.leadingAnchor, constant: 20),

            greenLabel.topAnchor.constraint(equalTo: custom.topAnchor, constant: 10),
            greenLabel.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: 10),
            
            imageView.topAnchor.constraint(equalTo: custom.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: greenLabel.font.lineHeight),
            imageView.trailingAnchor.constraint(equalTo: custom.trailingAnchor, constant: -20),
        ]

        if isLandscape() {
            NSLayoutConstraint.activate(landscapeConstraints)
        }
        else {
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }

    func isLandscape() -> Bool {
        let screenSize = UIScreen.main.bounds
        return screenSize.width > screenSize.height
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { context in
            NSLayoutConstraint.deactivate(self.landscapeConstraints)
            NSLayoutConstraint.deactivate(self.portraitConstraints)
            
            if self.isLandscape() {
                NSLayoutConstraint.activate(self.landscapeConstraints)
                print("Landscape")
            } else {
                NSLayoutConstraint.activate(self.portraitConstraints)
                print("Portrait")
            }
            
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

