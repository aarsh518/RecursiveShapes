//
//  ViewController.swift
//  RecursiveShapes
//
//  Created by Aarsh Parekh on 14/08/23.
//

import UIKit

class ViewController: UIViewController {

    var recursiveShapeView: RecursiveShapesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recursiveShapeView = RecursiveShapesView(count: 8, frame: view.bounds)
        view.addSubview(recursiveShapeView)
    }
}

