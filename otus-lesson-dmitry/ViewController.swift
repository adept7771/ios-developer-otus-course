//
//  ViewController.swift
//  otus-lesson-dmitry
//
//  Created by Dmitry Potapov on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false

        label1.text = "Label1"
        label1.backgroundColor = .red

        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false

        label2.text = "Label2"
        label2.backgroundColor = .green

        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(imageView)

        label1.setContentHuggingPriority(UILayoutPriority(252), for: .horizontal)
        label2.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)


        NSLayoutConstraint.activate([

            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label1.trailingAnchor.constraint(equalTo: label2.leadingAnchor, constant: 10),

            label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),


            //imageView.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),

            
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(screenHeight / 10)),

            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: label1.font.lineHeight)
        ])
    }
}

