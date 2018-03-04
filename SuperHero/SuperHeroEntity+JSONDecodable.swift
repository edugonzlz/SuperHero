extension SuperHeroEntity: JSONDecodable {
    init(dictionary: JSONDictionary) throws {

        guard let name = dictionary["name"] as? String else {
            throw JSONDecodingError.wrongJSONFormat
        }
        guard let photo = dictionary["photo"] as? String else {
            throw JSONDecodingError.wrongJSONFormat
        }
        if let realName = dictionary["realName"] as? String {
            self.realName = realName
        }
        if let realName = dictionary["realName"] as? String {
            self.realName = realName
        }
        if let height = dictionary["height"] as? String {
            self.height = height
        }
        if let power = dictionary["power"] as? String {
            self.power = power
        }
        if let abilities = dictionary["abilities"] as? String {
            self.abilities = abilities
        }
        if let groups = dictionary["groups"] as? String {
            self.groups = groups
        }
        self.name = name
        self.photo = photo
    }
}
