//
//  SelectViewController.swift
//  handwritten
//
//  Created by rei8 on 2021/06/22.
//  Copyright © 2021 lithium03. All rights reserved.
//

import UIKit
import UniformTypeIdentifiers

class SelectViewController: UIViewController {

    var userText = ""
    
    @IBOutlet weak var textArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textArea.layer.borderColor = UIColor.systemGreen.cgColor
        textArea.layer.borderWidth = 1
        
        textArea.text = userText
    }
    
    @IBAction func tapSelectFile(_ sender: Any) {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.text])
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        userText = textArea.text
    }
}

extension SelectViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            return
        }
        guard url.startAccessingSecurityScopedResource() else {
            print("can't access")
            return
        }
        defer { url.stopAccessingSecurityScopedResource() }
        do {
            let text = try String(contentsOf: url, encoding: .utf8)
            textArea.text = text
        } catch {
            print(error)
        }
    }

}
