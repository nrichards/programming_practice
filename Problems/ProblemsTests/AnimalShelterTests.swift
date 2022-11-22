//
//  AnimalShelterTests.swift
//  ProblemsTests
//
//  Created by Nicholas Richards on 11/21/22.
//

import XCTest

final class AnimalShelterTests: XCTestCase {
    let date: Date = Date.now

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func createMockAnimal(kind: Animal.Kind, name: String) -> Animal {
        let animal = Animal(kind: Animal.Kind.Cat, name: name, date: date)
        return animal
    }

    func testAnimal() throws {
        let animal = createMockAnimal(kind: Animal.Kind.Cat, name: "bob")

        XCTAssert(animal.kind == Animal.Kind.Cat)
        XCTAssert(animal.name == "bob")
        XCTAssert(animal.date == date)
    }

    func testAnimalLinkedList() throws {
        let animal1 = createMockAnimal(kind: Animal.Kind.Cat, name: "bob")
        let animal2 = createMockAnimal(kind: Animal.Kind.Dog, name: "max")
        let animal3 = createMockAnimal(kind: Animal.Kind.Cat, name: "butch")

        let list = AnimalLinkedList()

        XCTAssert(list.dequeue() == nil)
        list.enqueue(animal1)
        list.enqueue(animal2)
        list.enqueue(animal3)

        let d1 = list.dequeue()
        let d2 = list.dequeue()
        let d3 = list.dequeue()
        XCTAssert(animal1.name == d1!.name)
        XCTAssert(animal2.name == d2!.name)
        XCTAssert(animal3.name == d3!.name)
        XCTAssert(list.dequeue() == nil)
    }

    func testAnimalShelter() throws {
        let shelter = AnimalShelter()

        shelter.enqueue(kind: Animal.Kind.Cat, name: "bob")
        shelter.enqueue(kind: Animal.Kind.Dog, name: "max")
        shelter.enqueue(kind: Animal.Kind.Cat, name: "butch")

        let dog = shelter.dequeueDog()
        XCTAssert(dog!.name == "max")

        let cat1 = shelter.dequeueAny()
        XCTAssert(cat1!.name == "bob")

        let cat2 = shelter.dequeueCat()
        XCTAssert(cat2!.name == "butch")
    }
}
