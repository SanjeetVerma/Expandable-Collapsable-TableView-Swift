//
//  CollapsableTableViewController.swift
//  ExpandableView
//
//  Created by Sanjeet Verma on 18/11/17.
//  Copyright © 2017 Sanjeet Verma. All rights reserved.
//

import UIKit

class CollapsableTableViewController: UITableViewController {

    let data = [CollapsableViewModel(label: "Account", image: UIImage(named:"sanjeet"), children: [CollapsableViewModel(label: "Profile", ischild: false),CollapsableViewModel(label: "Activate account", ischild: false),CollapsableViewModel(label: "Change password", ischild: false)], ischild: true),
        CollapsableViewModel(label: "Group", ischild: true),
        CollapsableViewModel(label: "Events", image: nil, children: [CollapsableViewModel(label: "Nearby", ischild: false),CollapsableViewModel(label: "Global", ischild: false),], ischild: true),
        CollapsableViewModel(label: "Deals", ischild:true),
       
        ]
    var displayedRows: [CollapsableViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        displayedRows = data
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.showsVerticalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return displayedRows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! CollapsibleTableViewCell
       

        cell.configure(viewModel: displayedRows[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        let viewModel = displayedRows[indexPath.row]
        if viewModel.children.count > 0 {
            let range = indexPath.row+1...indexPath.row+viewModel.children.count
            let indexPaths = range.map{
              
                return NSIndexPath(row: $0, section: indexPath.section)
            }
            tableView.beginUpdates()
            let cell = tableView.cellForRow(at: indexPath) as! CollapsibleTableViewCell
            
            if viewModel.isCollapsed
            {
                cell.rightArrowImage.image = #imageLiteral(resourceName: "downArrow")
                displayedRows.insert(contentsOf: viewModel.children, at: indexPath.row+1)
                tableView.insertRows(at: indexPaths as [IndexPath], with: .automatic)
            }
            else
            {
                cell.rightArrowImage.image = #imageLiteral(resourceName: "rightArrow")
                displayedRows.removeSubrange(range)
                tableView.deleteRows(at: indexPaths as [IndexPath], with: .automatic)
            }
            tableView.endUpdates()
        }
        viewModel.isCollapsed = !viewModel.isCollapsed
        
        if viewModel.label == "Account"{
        
            print("Account Cell tapped")
            
        }else if viewModel.label == "Group"{
        
            print("Group Cell tapped")
        }else if viewModel.label == "Events"{
        
            print("Events Cell tapped")
        }else if viewModel.label == "Deals"{
        
            print("Deals Cell tapped")
        }else if viewModel.label == "Profile"{
        
            print("Profile Cell tapped")
        }else if viewModel.label == "Activate account"{
        
            print("Active account Cell tapped")
        }else if viewModel.label == "Change password"{
        
            print("Change password Cell tapped")
        }else if viewModel.label == "Nearby"{
        
            print("Nearby Cell tappped")
        }else if viewModel.label == "Global"{
        
            print("Global Cell tapped")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 64
    }
    
}
