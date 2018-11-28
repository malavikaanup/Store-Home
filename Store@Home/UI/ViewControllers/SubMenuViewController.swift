//
//  SubMenuViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 25/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class SubMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var submenuTableView: UITableView!
    
    var menuDict = [String: [String]]()
    var titlesArray = [String]()
    var subMenuArray = [[String]]()
    var expandedSection = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlesArray = ["Fruits & Vegetables", "Foodgrains, Oil & Masala", "Bakery, Cakes & Dairy", "Beverages", "Snacks & Branded Foods", "Beauty & Hygiene", "Cleaning & Household", "Kitchen, Garden & Pets", "Eggs, Meat & Fish", "Gourmet & World Food", "Baby Care"]
        subMenuArray = [["All Fruits & Vegetables", "Fresh Vegetables", "Fresh Fruits", "Herbs  & Seasonings", "Cuts & Sprouts", "Exotic Fruits & Veggies", "Organic Fruits & Vegetables", "Flower Bouquets, Bunches"],
            ["All Foodgrains, Oil & Masala", "Atta, Flour & Sooji", "Rice & Rice Products", "Dals & Pulses", "Salt, Sugar & Jaggery", "Edible Oils & Ghee", "Organic Staples", "Masalas & Spices", "Dry Fruits"],
            [" All Bakery, Cakes & Dairy", "Dairy", "Breads & Buns", "Cookies, Rusk & Khari", "Gourmet Breads", "Bakery Snacks", "Cakes & Pasteries", "Ice Creams & Desserts"],
            ["All Beverages", "Water", "Health Drink, Supplement", "Tea", "Energy & Soft Drinks", "Coffee", "Fruit Juices & Drinks"],
            ["All Snacks & Branded Foods", "Breakfast Cereals", "Noodle, Pasta, Vermicelli", "Biscuits & Cookies", "Frozen Veggies & Snacks", "Snacks & Namkeen", "Spreads, Sauces & Ketchup", "Ready To Cook & Eat", "Chocolates & Candies", "Pickles & Chutney", "Indian Mithai"],
            ["All Beauty & Hygiene", "Feminine Hygiene", "Oral Care", "Bath & Hand Wash", "Hair Care", "Men's Grooming", "Health & Medicine", "Skin Care", "Fragrances & Deos", "Makeup"],
            ["All Cleaning & Household", "Detergents & Dishwash", "All Purpose Cleaners", "Disposables, Garbage Bag", "Fresheners & Repellents", "Bins & Bathroom Ware", "Mops, Brushes & Scrubs", "Pooja Needs", "Car & Shoe Care", "Stationery", "Party  & Festive Needs"],
            ["All Kitchen, Garden & Pets", "Storage & Accessories", "Pet Foods & Accessories", "Steel Utensils", "Cookware & Non Stick", "Gardening", "Appliances & Electricals", "Kitchen Accessories", "Flask & Casserole", "Crockery & Cutlery", "Bakeware"],
            ["All Eggs, Meat & Fish", "Eggs", "Poultry", "Mutton & Lamb", "Sausages, Bacon & Salami", "Pork & Other Meats", "Fish & Seafood", "Marinades"],
            ["All Gourmet & World Food", "Oils & Vinegar", "Dairy & Cheese", "Snacks, Dry Fruits, Nuts", "Pasta, Soup & Noodles", "Chocolates & Biscuits", "Cooking & Baking Needs", "Sauces, Spreads & Dips", "Cereals & Breakfast", "Tinned & Processed Food", "Drinks & Beverages"],
            ["All Baby Care", "Diapers & Wipes", "Baby Food & Formula", "Baby Bath & Hygiene", "Mothers & Maternity", "Feeding & Nursing", "Baby Accessories"]]
        menuDict = ["Fruits & Vegetables": [], "Foodgrains, Oil & Masala": [], "Bakery, Cakes & Dairy": [], "Beverages": [], "Snacks & Branded Foods": [], "Beauty & Hygiene": [], "Cleaning & Household": [], "Kitchen, Garden & Pets": [], "Eggs, Meat & Fish": [], "Gourmet & World Food": [], "Baby Care": []]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func revealSectionContents(_ sender: Any) {
        var section = -1
        var addButton = UIButton()
        if sender is UIButton {
            addButton = sender as! UIButton
            
        } else if sender is UITapGestureRecognizer {
            let header = ((sender as! UITapGestureRecognizer).view) as! MenuHeaderView
            addButton = header.addButton
        }
        
        section = (addButton.superview?.superview as! MenuHeaderView).section
        let keyString = titlesArray[section]

        if expandedSection != -1 && expandedSection != section {
            var prevIndexPaths = [IndexPath]()
            for row in subMenuArray[expandedSection].indices {
                let indexPath = IndexPath(row: row, section: expandedSection)
                prevIndexPaths.append(indexPath)
            }
            menuDict.updateValue([], forKey: titlesArray[expandedSection])
            submenuTableView.deleteRows(at: prevIndexPaths, with: UITableViewRowAnimation.none)
            submenuTableView.reloadSections(IndexSet(integer: expandedSection), with: UITableViewRowAnimation.none)
        }
        
        var indexPaths = [IndexPath]()
        for row in subMenuArray[section].indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        if addButton.isSelected {
            menuDict.updateValue([], forKey: keyString)
            submenuTableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.none)
        } else {
            menuDict.updateValue(subMenuArray[section], forKey: keyString)
            submenuTableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.none)
        }
        addButton.isSelected = !addButton.isSelected
        expandedSection = section
        if addButton.isSelected == true {
            submenuTableView.scrollToRow(at: IndexPath(row: 0, section: section), at: UITableViewScrollPosition.top, animated: true)
        } else {
            submenuTableView.scrollsToTop = true
        }
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titlesArray.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keyString = titlesArray[section]
        let valueArray = menuDict[keyString]
        return (valueArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MenuHeaderView.instanceFromNib()
        headerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 60.0)
        headerView.sectionLabel.text = titlesArray[section]
        headerView.addButton.addTarget(self, action: #selector(revealSectionContents(_:)), for: UIControlEvents.touchUpInside)
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(revealSectionContents(_:)))
        tapGest.numberOfTapsRequired = 1
        headerView.addGestureRecognizer(tapGest)
        headerView.section = section
        let keyString = titlesArray[section]
        let valueArray = menuDict[keyString]
        headerView.addButton.isSelected = valueArray?.count == 0 ? false : true
        
        let rearWidth = self.revealViewController().rearViewRevealWidth
        headerView.addButtonTrailConstraint.constant = (screenWidth - rearWidth) + 20.0
        return headerView   
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "submenuCell") as! SideMenuTableViewCell
        let keyString = titlesArray[indexPath.section]
        let valueArray = menuDict[keyString] as! [String]
        cell.titleLabel.text = valueArray[indexPath.row]
        return cell
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
