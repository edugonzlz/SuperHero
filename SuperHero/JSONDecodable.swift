import Foundation

typealias JSONDictionary = [String: Any]

protocol JSONDecodable {
    init(dictionary: JSONDictionary) throws
}

func decode<T: JSONDecodable>(_ dictionary: JSONDictionary) -> T? {
    do {
        let object = try T(dictionary: dictionary)
        return object
    } catch {
        print("Error decoding: \(error)")
    }
    return nil
}

func decode<T: JSONDecodable>(_ dictionaries: [JSONDictionary]) -> [T]? {
    return dictionaries.flatMap(decode)
}

func decode<T: JSONDecodable>(_ data: Data) -> T? {
    guard
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
        let jsonDictionary = jsonObject as? JSONDictionary,
        let object: T = decode(jsonDictionary) else {
            return nil
    }
    
    return object
}

func decode<T: JSONDecodable>(_ data: Data) -> [T]? {
    guard
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
        let jsonDictionary = jsonObject as? [JSONDictionary],
        let object: [T] = decode(jsonDictionary) else {
            return nil
    }
    return object
}
