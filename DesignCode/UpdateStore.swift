//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Mac on 17.05.2021.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData 
}
