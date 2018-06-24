//
//  SelectionRouter.swift
//  Home24
//
//  Created by Gustavo Melki Leal on 24/06/2018.
//  Copyright (c) 2018 Gustavo Melki. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SelectionRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SelectionDataPassing
{
  var dataStore: SelectionDataStore? { get }
}

class SelectionRouter: NSObject, SelectionRoutingLogic, SelectionDataPassing
{
  weak var viewController: SelectionViewController?
  var dataStore: SelectionDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: SelectionViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SelectionDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}