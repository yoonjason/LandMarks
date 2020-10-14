//
//  ContentView.swift
//  LandMarks
//
//  Created by twave on 2020/10/13.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData : UserData
    var landmark : Landmark
    
    var landmarkIndex : Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)//컨텐츠 화면 상단 가장자리까지 확장되도록 하려면 다음과 같은 코드를 추가한다.
                .frame(height: 300)
            CircleImage(image: landmark.image).offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button( action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
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
                .onAppear{
                    print("View Appeared")
                }
            
        }
    }
    
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
