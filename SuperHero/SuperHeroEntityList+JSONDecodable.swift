extension SuperHeroListEntity: JSONDecodable {
    init(dictionary: JSONDictionary) throws {
        if let superHeroList = dictionary["superheroes"] as? Array<JSONDictionary> {
            self.items = try superHeroList.fill()
        }
    }
}
