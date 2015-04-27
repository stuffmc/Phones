//
//  ViewController.swift
//  Phones
//
//  Created by Manuel "StuFF mc" Carrasco Molina on 27/04/15.
//  Copyright (c) 2015 Pomcast.biz. All rights reserved.
//

import UIKit
import AddressBookUI

class ViewController: UIViewController, ABPeoplePickerNavigationControllerDelegate {

  var myPeoplePicker : ABPeoplePickerNavigationController?

  override func viewDidLoad() {
    super.viewDidLoad()

    myPeoplePicker = ABPeoplePickerNavigationController()
    myPeoplePicker?.displayedProperties = [String(kABPersonAddressProperty)]
    myPeoplePicker?.peoplePickerDelegate = self
    presentViewController(self.myPeoplePicker!, animated: true) { }
  }
  
  func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController!,
    didSelectPerson person: ABRecordRef) {

      println(ABRecordCopyCompositeName(person).takeUnretainedValue())
      
      if let phones = ABRecordCopyValue(person, kABPersonPhoneProperty) {
        println("contact has a phone number")
      } else {
        println("contact has NO phone number")
      }
      
      if let a = ABRecordCopyValue(person, kABPersonAddressProperty) {
        println("contact has an address")
      } else {
        println("contact has NO address")
      }

      println()
      
      self.dismissViewControllerAnimated(true, completion: {
        self.presentViewController(self.myPeoplePicker!, animated: true) { }
      })
  }


}

