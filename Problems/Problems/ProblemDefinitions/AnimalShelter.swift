//
//  AnimalShelter.swift
//  Problems
//
//  Created by Nicholas Richards on 11/21/22.
//

import Foundation

class Animal {
    enum Kind {
        case Dog
        case Cat
    }

    var kind: Kind
    var name: String
    var date: Date

    var next: Animal?

    init(kind: Kind, name: String, date: Date) {
        self.kind = kind
        self.name = name
        self.date = date
    }
}

class AnimalLinkedList {
    var top: Animal?
    var end: Animal?

    func enqueue(_ animal: Animal) {
        if top != nil {
            end!.next = animal
            end = animal
        } else {
            top = animal
            end = animal
        }
    }

    func dequeue() -> Animal? {
        let result = top
        if let top = top {
            self.top = top.next
            if self.top == nil {
                end = nil
            }
        }
        return result
    }
}

/// 3.6 Animal Shelter: An animal shelter, which holds only dogs and cats, operates on a strictly "first in, first out" basis.
///   People must adopt either the "oldest" (based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type).
///   They cannot select which specific animal they would like.
///   Create the data structures to maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog, and dequeueCat.
///   You may use the built-in LinkedList data structure.
class AnimalShelter {
    var cats = AnimalLinkedList()
    var dogs = AnimalLinkedList()

    func enqueue(kind: Animal.Kind, name: String) {
        let animal = Animal(kind: kind, name: name, date: Date.now)
        let list = kind == Animal.Kind.Dog ? dogs : cats
        list.enqueue(animal)
    }

    func dequeueAny() -> Animal? {
        let topcat = cats.top
        let topdog = dogs.top

        if topcat == nil {
            return dequeueDog()
        } else if topdog == nil {
            return dequeueCat()
        }

        if topcat!.date <= topdog!.date {
            return dequeueCat()
        } else {
            return dequeueDog()
        }
    }

    func dequeueDog() -> Animal? {
        return dogs.dequeue()
    }

    func dequeueCat() -> Animal? {
        return cats.dequeue()
    }

    static func demo() {
        print("Hello animal lovers")
    }
}
