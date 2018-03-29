//
//  Article.swift
//  GitHubiOS
//
//  Created by Aleksander Maj on 29/03/2018.
//  Copyright © 2018 HTD. All rights reserved.
//

import Foundation

struct Article: Codable {
    let title: String
    let path: String
    let tags: [String]
}
