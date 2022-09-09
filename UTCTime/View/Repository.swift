//
//  Repository.swift
//  UTCTime
//
//  Created by Yujean Cho on 2022/09/08.
//

import Foundation

class Repository {
    func fetchNow(onComplited: @escaping (UTCTimeModel) -> Void) {
        let url = "http://worldclockapi.com/api/json/utc/now"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
            
            onComplited(model)
            
        }.resume()
    }
}
