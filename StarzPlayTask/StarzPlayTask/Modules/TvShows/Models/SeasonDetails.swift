//
//  SeasonDetails.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/7/22.
//

import Foundation

// MARK: - SeasonDetails
struct SeasonDetails : Codable {
    let _id : String?
    let air_date : String?
    let episodes : [Episodes]?
    let name : String?
    let overview : String?
    let id : Int?
    let poster_path : String?
    let season_number : Int?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case air_date = "air_date"
        case episodes = "episodes"
        case name = "name"
        case overview = "overview"
        case id = "id"
        case poster_path = "poster_path"
        case season_number = "season_number"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
        episodes = try values.decodeIfPresent([Episodes].self, forKey: .episodes)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
    }

}

struct Episodes : Codable {
    let air_date : String?
    let episode_number : Int?
    let crew : [Crew]?
    let guest_stars : [Guest_stars]?
    let id : Int?
    let name : String?
    let overview : String?
    let production_code : String?
    let season_number : Int?
    let still_path : String?
    let vote_average : Double?
    let vote_count : Int?

    enum CodingKeys: String, CodingKey {

        case air_date = "air_date"
        case episode_number = "episode_number"
        case crew = "crew"
        case guest_stars = "guest_stars"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case production_code = "production_code"
        case season_number = "season_number"
        case still_path = "still_path"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
        episode_number = try values.decodeIfPresent(Int.self, forKey: .episode_number)
        crew = try values.decodeIfPresent([Crew].self, forKey: .crew)
        guest_stars = try values.decodeIfPresent([Guest_stars].self, forKey: .guest_stars)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        production_code = try values.decodeIfPresent(String.self, forKey: .production_code)
        season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
        still_path = try values.decodeIfPresent(String.self, forKey: .still_path)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
    }

}

struct Guest_stars : Codable {
    let character : String?
    let credit_id : String?
    let order : Int?
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let original_name : String?
    let popularity : Double?
    let profile_path : String?

    enum CodingKeys: String, CodingKey {

        case character = "character"
        case credit_id = "credit_id"
        case order = "order"
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        character = try values.decodeIfPresent(String.self, forKey: .character)
        credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        known_for_department = try values.decodeIfPresent(String.self, forKey: .known_for_department)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
    }

}

struct Crew : Codable {
    let job : String?
    let department : String?
    let credit_id : String?
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let original_name : String?
    let popularity : Double?
    let profile_path : String?

    enum CodingKeys: String, CodingKey {

        case job = "job"
        case department = "department"
        case credit_id = "credit_id"
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        job = try values.decodeIfPresent(String.self, forKey: .job)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        known_for_department = try values.decodeIfPresent(String.self, forKey: .known_for_department)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
    }

}
