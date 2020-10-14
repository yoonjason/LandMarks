//
//  LandmarkList.swift
//  LandMarks
//
//  Created by twave on 2020/10/13.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData : UserData
    @State var showFavoritesOnly = false

    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        
        NavigationView {
            
            List {
                Toggle(isOn: $userData.showFavoriteOnly, label: {
                    Text("Favorites only")
                })
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoriteOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    
                }
            }
//            List(landmarkData) { landmark in
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                        LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
                .navigationBarTitle("LandMarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(UserData())
//            .previewDevice("iPhone SE")
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName) //기기별로 볼 수 있다. 프리뷰를
//        }
    }
}
