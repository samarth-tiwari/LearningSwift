import PlaygroundSupport
import UIKit

let queue = OperationQueue()

let task = BlockOperation {
    URLSession
}

queue.addOperation(task)


let view = UIView()
view.backgroundColor = #colorLiteral(red: 0.909803926944733, green: 0.47843137383461, blue: 0.643137276172638, alpha: 1.0)
view.frame = CGRect(x: 0, y: 0, width: 200 , height: 150)

let button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
button.backgroundColor = #colorLiteral(red: 0.721568644046783, green: 0.886274516582489, blue: 0.592156887054443, alpha: 1.0)
button.setTitleColor(#colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), for: .normal)
button.setTitle("button", for: .normal)
button.layer.cornerRadius = 10
view.addSubview(button)

class Responser: NSObject
{

    //Method to be called
    @objc func printname()
    {
        if task.isCancelled {
            print("About to start")
            task.start()
        }
        else {
            task.cancel()
        }
    }
}

let responder = Responser()
button.addTarget(responder, action: #selector(Responser.printname), for:.touchUpInside)

PlaygroundPage.current.liveView = view
