//
//  ViewController.swift
//  handwritten
//
//  Created by rei8 on 2020/06/02.
//  Copyright © 2020 lithium03. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var targetImage: UIImageView!
    let targets = TextTarget()
    var currentTarget = "" {
        didSet {
            drawTargetText(str: currentTarget)
        }
    }
    
    var inputtype: TextTarget.texttype = .hiragana
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        drawView.layer.borderColor = UIColor.systemGreen.cgColor
        drawView.layer.borderWidth = 2.0

        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 128, height: 128))
        myView.backgroundColor = .clear
        myView.layer.position = CGPoint(x: 64, y: 64)
        myView.alpha = 0.2
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        shapeLayer.fillColor = UIColor.gray.cgColor
        myView.layer.addSublayer(shapeLayer)
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 128, height: 128))
        path.append(UIBezierPath(rect: CGRect(x: 16, y: 16, width: 96, height: 96)))
        shapeLayer.path = path.cgPath
        shapeLayer.fillRule = .evenOdd
        
        drawView.addSubview(myView)

        currentTarget = targets.getRandomChar(type: inputtype)
        countLabel.text = "\(targets.count) / \(targets.allCount)"
    }

    func drawTargetText(str: String) {
        let size = CGSize(width: 128, height: 128)
        let renderer = UIGraphicsImageRenderer(size: size)
        let im = renderer.image(actions: { rendererContext in
            rendererContext.cgContext.setFillColor(UIColor.white.cgColor)
            rendererContext.cgContext.fill(CGRect(origin: .zero, size: size))
            UIGraphicsPushContext(rendererContext.cgContext)
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            (str as NSString).draw(in: CGRect(origin: .zero, size: size), withAttributes: [
                .font: UIFont.systemFont(ofSize: 100),
                .paragraphStyle: paragraph,
            ])
            UIGraphicsPopContext()
        })
        targetImage.image = im
    }
    
    @IBAction func clearTaped(_ sender: Any) {
        drawView.clear()
    }
    
    @IBAction func passTaped(_ sender: Any) {
        currentTarget = targets.getRandomChar(type: inputtype)
        countLabel.text = "\(targets.count) / \(targets.allCount)"
        drawView.clear()
    }
    
    @IBAction func typeSegmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            inputtype = .hiragana
        case 1:
            inputtype = .katakana
        case 2:
            inputtype = .kanji
        case 3:
            inputtype = .kigo
        default:
            inputtype = .user
            performSegue(withIdentifier: "toSelectUser", sender: nil)
        }
        
        currentTarget = targets.getRandomChar(type: inputtype)
        countLabel.text = "\(targets.count) / \(targets.allCount)"
        drawView.clear()
    }
    
    @IBAction func nextTaped(_ sender: Any) {
        if let im = drawView.snapshotImage {
            let name = currentTarget.utf8.map({ String($0, radix: 16) }).joined()
            guard let url = FileManager.default.url(forUbiquityContainerIdentifier: nil) else {
                return
            }
            let path = url.appendingPathComponent("Documents").appendingPathComponent("images").appendingPathComponent(name)
            do {
                try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                print(error)
                return
            }
            let filename = path.appendingPathComponent("\(UUID().uuidString).png")
            let pic = Picture(fileURL: filename)
            pic.image = im
            pic.save(to: filename, for: .forCreating)
        }
        else {
            return
        }
        currentTarget = targets.getRandomChar(type: inputtype)
        countLabel.text = "\(targets.count) / \(targets.allCount)"
        drawView.clear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelectUser" {
            guard let secondVC = segue.destination as? SelectViewController else {
                return
            }
            secondVC.userText = targets.userSelect.map({ String($0) }).joined()
        }
    }
    
    @IBAction func unwindFromSecondVC(segue: UIStoryboardSegue) {
        // Here you can receive the parameter(s) from secondVC
        guard let secondVC = segue.source as? SelectViewController else {
            return
        }
        if secondVC.userText.count > 0 {
            targets.userSelect = Array(Set(secondVC.userText.components(separatedBy: .whitespacesAndNewlines).joined())).sorted()
            
            currentTarget = targets.getRandomChar(type: .hiragana)
            currentTarget = targets.getRandomChar(type: inputtype)
            countLabel.text = "\(targets.count) / \(targets.allCount)"
            drawView.clear()
        }
    }

}

class Picture: UIDocument {
    var image: UIImage?

    override func contents(forType typeName: String) throws -> Any {
        guard let im = image else {
            return Data()
        }
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1

        let size = CGSize(width: 128, height: 128)
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let resizedImage = renderer.image { ctx in
            im.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.pngData() as Any
    }

    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        guard let contents = contents as? Data else { return }
        image = UIImage(data: contents)
    }
}
