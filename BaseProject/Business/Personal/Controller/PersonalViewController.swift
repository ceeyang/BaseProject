//
//  PersonalViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var friends: [Person] = []
    var bestFriend: Person? = nil
    init(name: String) {
        self.name = name
    }
}

class PersonalViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.random()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        struct Person {
            var name: String
        }
        
        struct Book {
            var title: String
            var authors: [Person]
            var primaryAuthor: Person {
                return authors.first!
            }
        }
        
        let abelson = Person(name: "Harold Abelson")
        let sussman = Person(name: "Gerald Jay Sussman")
        let book = Book(title: "Structure and Interpretation of Computer Programs", authors: [abelson, sussman])
        
        print(book)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
