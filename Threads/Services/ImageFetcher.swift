//  Created by Maciej Gorecki on 08/03/2024.

import Foundation
import UIKit

struct ImageFetcher {
    enum Error: Swift.Error {
        case invalidImage
    }

    let fetch: (URL) async throws -> UIImage
}

extension ImageFetcher {
    static func live(
        imageCache: NSCache<NSURL, UIImage> = .init(),
        urlSession: URLSession = .shared
    ) -> Self {
        .init(
            fetch: { url in
                if let cache = imageCache.object(forKey: url as NSURL) {
                    return cache
                }

                let (data, _) = try await urlSession.data(from: url)

                guard let image = UIImage(data: data) else {
                    throw Error.invalidImage
                }

                imageCache.setObject(image, forKey: url as NSURL)

                return image
            }
        )
    }
}
