//
//  ViewController.swift
//  PopOverDemo
//
//  Created by day on 10/10/17.
//  Copyright © 2017 day. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UIPopoverPresentationControllerDelegate{

    @IBOutlet weak var tableView: UITableView!
//    var myCustomView : showHideView = showHideView()
    var myCustomView = ShowHideView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.btnAction.addTarget(self, action: #selector(ViewController.showHidePost), for: .touchUpInside)
       
        
        return cell
    }
    
   @objc func showHidePost(sender: UIButton)   {
        var popoverContent:popOver!
        popoverContent = storyboard?.instantiateViewController(withIdentifier: "popOverIphone") as! popOver
        popoverContent.modalPresentationStyle = .popover
        if let popover = popoverContent.popoverPresentationController {
        let viewForSource = sender
        popover.sourceView = viewForSource
        popover.sourceRect = viewForSource.bounds
        popover.permittedArrowDirections = .up
        popoverContent.preferredContentSize = CGSize(width: 150, height: 50)
        
        }

        popoverContent.view.backgroundColor = UIColor(red: 247/255.0, green: 245/255.0, blue: 246/255.0, alpha: 1.0);
        popoverContent.popoverPresentationController?.delegate = self;
        self.present(popoverContent, animated: true) {
        popoverContent.view.tintColor = UIColor.black
        
        }
    
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class popOver:UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func unfrinedButtonAction(sender:UIButton)
    {
        
    }
    
    
    
}

