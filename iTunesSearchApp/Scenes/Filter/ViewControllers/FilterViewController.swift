//
//  FilterViewController.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift

final class FilterViewController: BaseViewController {
    
    var disposeBag: DisposeBag!
    var stackView: UIStackView!
    var viewModel: FilterViewModel!
    let stateManager = StateManager.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUIControls()
    }
        
    private func setupUIControls() {        
        stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.safeArea.top).offset(20)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        stateManager
            .get(.filter)
            .behaviorRelay
            .subscribe(onNext: { [weak self] state in
                
                var selectedFilter = "all"
                
                if let _state = state as? FilterStateListDTO, _state.taskStateList.count > 0 {
                    selectedFilter = _state.taskStateList.first?.title ?? "all"
                }
                
                self?.stackView.removeAllArrangedSubviews()
                
                _ = self?.viewModel.filters.map { filter in
                    var _temp = filter
                    let filterView = FilterTypeView()
                    _temp.selected = selectedFilter.lowercased().elementsEqual(filter.name.lowercased())
                    filterView.model = _temp
                    self?.stackView.addArrangedSubview(filterView)
                }
                
            }).disposed(by: disposeBag)
    }
    
}
