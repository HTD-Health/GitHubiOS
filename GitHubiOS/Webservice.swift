//
//  Webservice.swift
//  GitHubiOS
//
//  Created by Aleksander Maj on 29/03/2018.
//  Copyright © 2018 HTD. All rights reserved.
//

import Foundation

class Webservice {
    enum Result<T> {
        case success(T)
        case error(Error)
    }

    let baseURL = "https://www.healthcare.gov/api/"
    func loadGlossary(completion: @escaping (Result<[Article]>) -> Void) {
        let endpoint = baseURL + "glossary.json"

        let url = URL(string: endpoint)!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data, error == nil {
//                do {
//                    let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: [[String: Any]]]
//                } catch {
//                    debugPrint(error.localizedDescription)
//                }

                let decoder = JSONDecoder()
                do {
                    let glossary: [String: [Article]] = try decoder.decode([String: [Article]].self, from: data)
                    let articles: [Article] = glossary["glossary"]!
                    completion(Result.success(articles))
                } catch {
                    completion(Result.error(error))
                }
            } else {
                completion(Result.error(error!))
            }
        }.resume()
    }
}
