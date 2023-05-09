import Foundation

func example() -> Void {
    // ruleid: insecure-random
    let randomInt = Int.random(in: 0..<6)
    // ruleid: insecure-random
    let randomDouble = Double.random(in: 2.71828...3.14159)
    // ruleid: insecure-random
    let randomBool = Bool.random()

    // ruleid: insecure-random
    let diceRoll = Int(arc4random_uniform(6) + 1)


    // ruleid: insecure-random
    let a = Int.random(in: 0 ... 10)

    // ruleid: insecure-random
    var k: Int = random() % 10;

    // ruleid: insecure-random
    let randomNumber = arc4random()

    var r: Self = 0
    // ruleid: insecure-random
    arc4random_buf(&r, MemoryLayout<Self>.size)

    // ruleid: insecure-random
    let x = Int.random(in: 1...100)
    // ruleid: insecure-random
    var g = SystemRandomNumberGenerator()
    // ruleid: insecure-random
    let y = Int.random(in: 1...100, using: &g)

    // ruleid: insecure-random
    if (Int.random(in: 1...100) <  50) {
        println("foo")
    }

    var printRandom = {
        // ruleid: insecure-random
        let a = Int.random(in: 1...10)
        print(a)
    }
    
    // okid: insecure-random
    Test.random(in: 1...10)
}

