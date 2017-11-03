//
//  DAPTableViewController.swift
//  ParsingDataActors
//
//  Created by DOTS2 on 11/3/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class DAPTableViewController: UITableViewController {
    
    let ActorsURL = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
    
    var actorS = [Actors]()
    var nameSelected:String?
    var descSelected:String?
    var dobSelected:String?
    var countrySelected:String?
    var heightSelected:String?
    var spouseSelected:String?
    var childrenSelected:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        getActor()
        //self sizing cells
        //set row height to 92
        tableView.estimatedRowHeight = 92.0
        //set row table height to automatic dimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actorS.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DATableViewCell

        cell.lblName.text = actorS[indexPath.row].name
        cell.lbldob.text = actorS[indexPath.row].dob
        cell.lblcountry.text = actorS[indexPath.row].country
        cell.lblheight.text = actorS[indexPath.row].height

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    //mengecek data yang dikirim
    let dataTask = actorS[indexPath.row]
    //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        nameSelected = dataTask.name
        countrySelected = dataTask.country
        descSelected = dataTask.desc
         dobSelected = dataTask.dob
        heightSelected = dataTask.height
         spouseSelected = dataTask.spouse
         childrenSelected = dataTask.child
    //memamnggil segue passDataDetail
    performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! ViewController
            sendData.passName = nameSelected
            sendData.passcountry = countrySelected
            sendData.passDesc = descSelected
            sendData.passdob = dobSelected
            sendData.passspouse = spouseSelected
            sendData.passchild = childrenSelected
            sendData.passheight = heightSelected
        }
    }
    //MARK : - JSON Parsing
    //create new method with name : getLatestLoans()
    func getActor() {
        guard let Actorurl = URL(string: ActorsURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        
        //declare request for request URL loanUrl
        let request = URLRequest(url: Actorurl)
        //declare task for take data from variable request above
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            //check what error is available or not
            if let error = error {
                //condition when error
                //print error
                print(error)
                return //back up value error that we get
            }
            //parse JSON data
            //declare variable data to call data
            if let data = data {
                //for this part will call method parseJsonData that we will make in below
                self.actorS = self.parseJsonData(data: data)
                
                //reload tableView
                OperationQueue.main.addOperation({
                    //reload data again
                    self.tableView.reloadData()
                })
            }
        })
        //task will resume to call the json data
        task.resume()
    }
    //create new method with name ParseJsonData
    //this method will parsing data Json
    func parseJsonData(data: Data) -> [Actors] {
        //declare variable loans as object from loans class
        var Actorss = [Actors]()
        //will repeat to json data that parsed
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            //parse json data
            //declare jsonLoans for call data array jsonResult with name Loans
            let jsonLoans = jsonResult?["actors"] as! [AnyObject]
            //will call data be repeated for jsonLoan have data json array from variable jsonLoans
            for jsonLoan in jsonLoans {
                //declare loan as object from class loan
                let aCtor = Actors()
                //enter the value to each object from class loan
                aCtor.name = jsonLoan["name"] as! String
                aCtor.country = jsonLoan["country"] as! String
                aCtor.desc = jsonLoan["description"] as! String
                aCtor.dob = jsonLoan["dob"] as! String
                aCtor.height = jsonLoan["height"] as! String
                aCtor.spouse = jsonLoan["spouse"] as! String
                aCtor.child = jsonLoan["children"] as! String
                //process enter data to object
                Actorss.append(aCtor)
            }
        }catch{
            print(error)
        }
        return Actorss
    }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


