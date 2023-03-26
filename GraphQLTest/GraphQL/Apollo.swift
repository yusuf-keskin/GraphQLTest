//
//  Apollo.swift
//  GraphQLTest
//
//  Created by YUSUF KESKİN on 26.03.2023.
//
import Foundation
import Apollo

class Apollo {
  // 1
  static let shared = Apollo()
  // 2
  let client: ApolloClient
  // 3
  init() {
    // swiftlint:disable:next force_unwrapping
    client = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
  }
}
