//
//  BasicMVVMViewModel.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/25.
//

import Foundation

class PersonViewModel {
    static var personList = [Person(name: "name10", age: 10), Person(name: "name20", age: 20), Person(name: "name30", age: 30)]
    
    var list: Observable<[Person]> = Observable(personList)
    
    func appendPerson(person: Person) {
        self.list.value.append(person)
    }
}

