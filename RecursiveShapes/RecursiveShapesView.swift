//
//  RecursiveShapesView.swift
//  RecursiveShapes
//
//  Created by Aarsh Parekh on 14/08/23.
//

import UIKit

/* The purpose of this class RecursiveShapesView is to draw a triangle and square recirsively on a view. The rule is that the triangle must be an equilateral triangle and the square must fit inside this triangle matching it's sides. The first shape would be the triangle followed by the square and so on recursively.
 */

class RecursiveShapesView: UIView {
    // count variable determines how many shapes are supposed to be drawn. Default value is 1
    private var count: Int = 1
    
    init(count: Int, frame: CGRect = .zero) {
        super.init(frame: frame)
        // avoiding -ve and 0 to be assigned to the count variable
        if count > 0 {
            self.count = count
        }
        drawRecursiveShapes()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawRecursiveShapes()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        drawRecursiveShapes()
    }
}

private extension RecursiveShapesView {
    func drawRecursiveShapes() {
        // defining initial drawing area
        var drawingCanvasSize = min(frame.width, frame.height)
        var drawingCanvasRect = CGRect(x: frame.minX, y: frame.midY - (drawingCanvasSize/2), width: drawingCanvasSize, height: drawingCanvasSize)
        // As first shape is a triangle followed by a square, an odd index tells the compiler to draw an triangle and an even index tells the compilet to draw an square.
        for i in 1...count {
            if i % 2 != 0 {
                // Draw Triangle
                drawTriangle(drawingArea: drawingCanvasRect)
                // After drawing the triangle, we need to guide the compiler with the frame to draw the square. The size of the square would be 1/2 the size of the side of our equilateral triangle.
                drawingCanvasSize = drawingCanvasRect.width/2
                drawingCanvasRect = CGRect(x: drawingCanvasRect.midX - (drawingCanvasSize/2), y: drawingCanvasRect.midY, width: drawingCanvasSize, height: drawingCanvasSize)
            } else {
                // Draw Square
                drawSquare(drawingArea: drawingCanvasRect)
            }
        }
    }
    
    func drawTriangle(drawingArea: CGRect) {
        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: drawingArea.midX, y: drawingArea.minY))
        trianglePath.addLine(to: CGPoint(x: drawingArea.minX, y: drawingArea.maxY))
        trianglePath.addLine(to: CGPoint(x: drawingArea.maxX, y: drawingArea.maxY))
        trianglePath.close()
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.strokeColor = UIColor.black.cgColor
        triangleLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(triangleLayer)
    }
    
    func drawSquare(drawingArea: CGRect) {
        let squareLayer = CAShapeLayer()
        let squarePath = UIBezierPath(rect: drawingArea)
        squarePath.close()
        squareLayer.path = squarePath.cgPath
        squareLayer.strokeColor = UIColor.black.cgColor
        squareLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(squareLayer)
    }
}
