extension Array where Element == JSONDictionary {
	func fill<T:JSONDecodable>() throws -> [T] {
		return try map{ dictionary in try T(dictionary: dictionary) }
	}
}
