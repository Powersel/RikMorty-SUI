//
//  ServiceInfoDTO.swift
//  RM-SUI
//
//  Created by Sergiy on 12/28/24.
//

import Foundation

struct ServiceInfoDTO: Codable {
  let count: Int
  let pages: Int
  let next: String?
  let prev: String?
}

struct RMEpisodesDTO: Codable {
  let info: ServiceInfoDTO
  let results: [EpisodeDTO]
}
