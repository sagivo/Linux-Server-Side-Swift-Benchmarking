import Vapor

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct BlogHandler {

    func loadPageContent() -> String {

        var finalContent = "<section id=\"content\"><div class=\"container\">"

        let randomContent = ContentGenerator().generate()

        for _ in 1...5 {

            let index: Int = Int(arc4random_uniform(UInt32(randomContent.count)))
            let value = Array(randomContent.values)[index]
            let imageNumber = Int(arc4random_uniform(25) + 1)

            finalContent += "<div class=\"row blog-post\"><div class=\"col-xs-12\"><h1>"
            finalContent += "Test Post \(index)"
            finalContent += "</h1><img src=\""
            finalContent += "/img/random/random-\(imageNumber).jpg\" alt=\"Random Image \(imageNumber)\" class=\"alignleft feature-image img-responsive\" />"
            finalContent += "<div class=\"content\">\(value)</div>"
        }

        finalContent += "</div></div</div></section>"

        return finalContent
    }

}
