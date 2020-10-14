//
//  CategoryHomeHome.swift
//  LandMarks
//
//  Created by twave on 2020/10/14.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        Dictionary (
            grouping: landmarkData,
            by: {
                $0.category.rawValue
            }
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(),
                        id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            }
                .navigationBarTitle(Text("Featured"))
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
