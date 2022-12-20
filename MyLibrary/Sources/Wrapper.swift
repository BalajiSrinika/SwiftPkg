//
//  File.swift
//  
//
//  Created by Balaji  on 20/12/22.
//

import Foundation
import Alamofire
import UIKit

public class Design {
    
    public init() {}
    
    func AlamofireGetData(completion: @escaping ([SampleElement]) -> ()) {
        var url:String!
        url = "https://jsonplaceholder.typicode.com/comments"
        AF.request(url)
            .validate()
            .responseDecodable(of: [SampleElement].self) { (response) in
                guard let data = response.value else { return }
                completion(data)
            }
    }
}

struct SampleElement: Decodable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
