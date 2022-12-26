//
//  DictionaryTableViewController.swift
//  JSONParsingEx
//
//  Created by runnysun on 2022/10/24.
//

import UIKit

class DictionaryTableViewController: UITableViewController {
    var bts:[[String:String]]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        parsing()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func parsing(){
        do{
            guard let root = try JSONSerialization.jsonObject(with: jsonData) as? [String:Any],let bts = root["bts"] as? [[String:String]] else { return }
            self.bts = bts
            print(self.bts)
        } catch{
            print("파싱 실패")
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "btscell", for: indexPath)
        let member = bts[indexPath.row]
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        if let imageName = member["imageName"] {
            let image = UIImage(named: imageName)
            imageView?.image = image
            
            let lblNick = cell.viewWithTag(2) as? UILabel
            lblNick?.text = member["nick"]
            
            let lblName = cell.viewWithTag(3) as? UILabel
            lblName?.text = member["name"]
            
            return cell
        }
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
