//
//  GlobalHelpers.swift
//  MyNetflix
//
//  Created by Ding Lo on 18/7/2024.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!

let exampleImageURL1 = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!
var randomExampleImageURL: URL {
    return [exampleImageURL1, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL1
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL1)
let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL2)
let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL3)
let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]


let episode1 = Episode(
    name: "Beginnings and Endings",
    season: 1,
    thumbnailImageURL: "https://picsum.photos/300/102",
    description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
    length: 53,
    episodeNumber: 1,
    videoURL: exampleVideoURL
)
let episode2 = Episode(
    name: "Dark Matter",
    season: 1,
    thumbnailImageURL: "https://picsum.photos/300/103",
    description: "Clausen and Charlotte interview Regina. The Stranger taskes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits and old nameis.",
    length: 54,
    episodeNumber: 2,
    videoURL: exampleVideoURL
)
let episode3 = Episode(
    name: "Ghosts",
    season: 1,
    thumbnailImageURL: "https://picsum.photos/300/104",
    description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
    length: 56,
    episodeNumber: 3,
    videoURL: exampleVideoURL
)
let episode4 = Episode(
    name: "Beginnings and Endings",
    season: 2,
    thumbnailImageURL: "https://picsum.photos/300/105",
    description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
    length: 53,
    episodeNumber: 1,
    videoURL: exampleVideoURL
)
let episode5 = Episode(
    name: "Dark Matter",
    season: 2,
    thumbnailImageURL: "https://picsum.photos/300/106",
    description: "Clausen and Charlotte interview Regina. The Stranger taskes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits and old nameis.",
    length: 54,
    episodeNumber: 2,
    videoURL: exampleVideoURL
)
let episode6 = Episode(
    name: "Ghosts",
    season: 2,
    thumbnailImageURL: "https://picsum.photos/300/107",
    description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
    length: 56,
    episodeNumber: 3,
    videoURL: exampleVideoURL
)
var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 1,
    epidsodes: allExampleEpisodes,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    accentColor: Color.blue,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [exampleMovie3, exampleMovie2, exampleMovie7, exampleMovie6, exampleMovie5, exampleMovie4],
    trailers: exampleTrailers, 
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL
)
let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    promotionHeadline: "Best Rated Show",
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [],
    trailers: exampleTrailers,
    previewImageName: "arrestedDevPreview",
    previewVideoURL: exampleVideoURL
)
let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [],
    trailers: exampleTrailers,
    previewImageName: "darkPreview",
    previewVideoURL: exampleVideoURL
    
)
let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alon",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], 
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 4,
    promotionHeadline: "New episodes coming soon",
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [],
    trailers: exampleTrailers,
    previewImageName: "travelersPreview",
    previewVideoURL: exampleVideoURL
)
let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 5,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [], 
    trailers: exampleTrailers,
    previewImageName: "whiteLinesPreview",
    previewVideoURL: exampleVideoURL
)
let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    promotionHeadline: "Watch Season 6 Now",
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [],
    trailers: exampleTrailers,
    previewImageName: "whiteLinesPreview",
    previewVideoURL: exampleVideoURL
)
let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, 
    rating: "TV-MA",
    numberOfSeasons: 6, 
    promotionHeadline: "Watch Season 6 Now",
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Juntje Friese",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeMovies: [],
    trailers: exampleTrailers,
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL
)
let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Beginnings and Ending", description: "Six months after the disappearances, the police form a task force. In 2052....", season: 2, episdoe: 1)

