//
//  Data.swift
//  LandMarks
//
//  Created by twave on 2020/10/13.
//

import SwiftUI
import CoreLocation
import UIKit

let landmarkData: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2

    static var shared = ImageStore()

    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)

        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            //'url'에서 읽은 이미지 소스를 작성합니다.이 '옵션'이진수는 추가 생성 옵션을 요청하는 데 사용될 수 있습니다. 자세한 내용은 위의 키 목록을 참조하십시오.
        let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        //이미지 소스 'isrc'의 '인덱스'로 이미지를 반환합니다. 인덱스는 0 기반입니다.
        //"옵션"사전은 추가 작성 옵션을 요청하는 데 사용될 수 있습니다. 자세한 내용은 위의 키 목록을 참조하십시오.
            else {
                fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }

    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }

        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}

