//
//  SettingsView.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func settingsView(_ settingsView: SettingsView, didTap option: SettingOption)
}

final class SettingsView: UIView {
    
    weak var delegate: SettingsViewDelegate?
    
    private var viewModel: SettingsViewViewModel? {
        didSet {
            tableView.reloadData()
        }
    }

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: SettingsViewViewModel) {
        self.viewModel = viewModel
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.option.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let viewModel {
            cell.textLabel?.text = viewModel.option[indexPath.row].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewModel else { return }
        let option = viewModel.option[indexPath.row]
        delegate?.settingsView(self, didTap: option)
    }
    
}
