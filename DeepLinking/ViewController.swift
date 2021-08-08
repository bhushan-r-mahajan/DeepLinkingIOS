//
//  ViewController.swift
//  DeepLinking
//
//  Created by Gadgetzone on 03/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let faceBookButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "app1"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(appIconButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var data = ["Terms and Conditions", "Privacy", "Contact"]
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - Configure Functions
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = footer()
    }
    
    func footer() -> UIView {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 80))
        footer.addSubview(faceBookButton)
        faceBookButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        faceBookButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        faceBookButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor).isActive = true
        faceBookButton.centerXAnchor.constraint(equalTo: footer.centerXAnchor).isActive = true
        return footer
    }
    
    @objc func appIconButtonTapped() {
        let instagramHooks = "instagram://user?username=bhushan.r.mahajan"
        let instagramUrl = URL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl!) {
          UIApplication.shared.open(instagramUrl!)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
        }
    }
    
    //MARK: - TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

