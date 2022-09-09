//
//  Service.swift
//  UTCTime
//
//  Created by Yujean Cho on 2022/09/08.
//

import Foundation

class Service {
    let repository = Repository()
    
    var currentModel = Model(currentDateTime: Date()) // state
    
    func fetchNow(onComplited: @escaping (Model) -> Void) {
        
        // Entity -> Model
        repository.fetchNow { [weak self] entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: entity.currentDateTime) else { return }
            
            let model = Model(currentDateTime: now)
            self?.currentModel = model
            onComplited(model)
        }
    }
    
    func moveDay(day: Int) {
        guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else { return }
        currentModel.currentDateTime = movedDay
    }
}

