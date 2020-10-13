//
//  ContentView.swift
//  LandMarks
//
//  Created by twave on 2020/10/13.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark : Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)//컨텐츠 화면 상단 가장자리까지 확장되도록 하려면 다음과 같은 코드를 추가한다.
                .frame(height: 300)
            CircleImage(image: landmark.image).offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer() //공간 분리 한줄씩 밀려남
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
                .padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
