//
//  CourseStore.swift
//  DesignCode
//
//  Created by Mac on 30.05.2021.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "0kbi2dq57rup", accessToken: "3rPANl5P8Ic5f2VnQymXZkCst6uANfPopGOahZENOgI")

func getArray(id: String, completion: @escaping([Entry]) -> () ) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
            case .success(let array):
                DispatchQueue.main.async {
                    completion(array.items)
                    print(array.items)
                }
            case .failure(let error):
                print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData

    
    init() {
        let color = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),  #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),  #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),  #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)]
        
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                print(item.fields)
                self.courses.append(Course(
                                        title: item.fields["title"] as! String,
                                        subtitle: item.fields["subtitle"] as! String,
                                        image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                                        logo: #imageLiteral(resourceName: "Logo2"),
                                        color: color.randomElement()!,
                                        show: false))
            }
        }
    }
}
