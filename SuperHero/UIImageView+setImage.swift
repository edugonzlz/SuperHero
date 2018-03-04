import AlamofireImage

extension UIImageView {
    
	func setImage(withURL url: URL, completion: ((UIImage?)->Void)? = nil) {
        af_setImage(
            withURL: url,
            placeholderImage: nil,
            filter: nil,
            progress: nil,
            progressQueue: DispatchQueue.main,
            imageTransition: .crossDissolve(0.3),
            runImageTransitionIfCached: false,
			completion: { completion?($0.result.value) })
    }
    
    func cancelRequest() {
        af_cancelImageRequest()
    }
}
