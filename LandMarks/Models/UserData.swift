//
//  UserData.swift
//  LandMarks
//
//  Created by twave on 2020/10/14.
//

import SwiftUI
import Combine

final class UserData : ObservableObject {
    @Published var showFavoriteOnly = false
    @Published var landmarks = landmarkData //전역 변수로 되어있다.
    
    
}
