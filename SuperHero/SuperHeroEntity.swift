import Foundation

struct SuperHeroEntity {
    var name: String
    var photo: String
    var realName: String? = nil
    var height: String? = nil
    var power: String? = nil
    var abilities: String? = nil
    var groups: String? = nil
    
    init(name: String,
         photo: String,
         realName: String?,
         height: String?,
         power: String?,
         abilities: String?,
         groups: String?) {
        self.name = name
        self.photo = photo
        self.realName = realName
        self.height = height
        self.power = power
        self.abilities = abilities
        self.groups = groups
    }
}
