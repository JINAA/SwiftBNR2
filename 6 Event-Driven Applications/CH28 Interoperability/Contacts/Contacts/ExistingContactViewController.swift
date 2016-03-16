//
//  ExistingContactViewController.swift
//  Contacts
//
//  Created by Brigitte Michau on 2016/03/15.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {

    var contact: Contact? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        if let contact = self.contact {
            name?.text = contact.name
        }
    }
}
