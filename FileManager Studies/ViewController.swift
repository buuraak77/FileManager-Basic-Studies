//
//  ViewController.swift
//  FileManager Studies
//
//  Created by Burak Yılmaz on 6.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.placeholder = "Write Any Word To Save"
        
        
        
    }
    
    
    @IBAction func textSaveButton(_ sender: Any) {
        
        let text = textField.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathComponent("savedText.txt")
            
            do {
                try text.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
                textField.text = ""
            } catch  {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true)
            }
        }
        
        
    }
    
    @IBAction func textShowButton(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathComponent("savedText.txt")
            
            do {
                try textField.text = try String(contentsOf: filePath, encoding: String.Encoding.utf8)
            } catch  {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true)
            }
        }
        
        
        
    }
    
    @IBAction func textDeleteButton(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathComponent("savedText.txt")
            
            if FileManager.default.fileExists(atPath: filePath.path) {
                do {
                    try FileManager.default.removeItem(at: filePath)
                    textField.text = ""
                } catch  {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true)
                }
            }
        }
        
        
        
        
    }
    
    
    @IBAction func imageSaveButton(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathComponent("myImage.png")
            
            let image = UIImage(named: "swift.png")
            
            do {
                try image!.pngData()?.write(to: filePath)
            } catch  {
                //Alert
            }
        }
        
        
    }
    
    @IBAction func imageShowButton(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathComponent("myImage.png")
            
            self.imageView.image = UIImage(contentsOfFile: filePath.path)
        }
        
        
        
        
        
    }
    
    @IBAction func imageDeleteButton(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathComponent("myImage.png")
            
            if FileManager.default.fileExists(atPath: filePath.path) {
                do {
                    try FileManager.default.removeItem(at: filePath)
                    self.imageView.image = UIImage(named: "")
                } catch  {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    present(alert, animated: true)
                }
            }
        }
        
        
    }
    
    


}

