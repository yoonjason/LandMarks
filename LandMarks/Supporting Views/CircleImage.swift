//
//  CircleImage.swift
//  LandMarks
//
//  Created by twave on 2020/10/13.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .frame(width: 200.0, height: 200.0)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("iu"))
    }
}
